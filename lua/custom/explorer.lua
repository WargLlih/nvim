-- Floating Netrw Explorer: :Ex in a floating window with toggle
-- This module implements a persistent floating file explorer using built-in Netrw.

local M = {}

M.explorer_win = nil
M.explorer_buf = nil
M.last_dir = vim.fn.getcwd()
M.prev_win = nil  -- The window that was active before opening the explorer

function M.save_last_dir()
  if M.explorer_win and vim.api.nvim_win_is_valid(M.explorer_win) then
    local buf = vim.api.nvim_win_get_buf(M.explorer_win)
    local dir = vim.b[buf].netrw_curdir
    if dir and vim.fn.isdirectory(dir) == 1 then
      M.last_dir = dir
    end
  end
end

function M.toggle_explorer()
  -- If window exists and is valid, hide it
  if M.explorer_win and vim.api.nvim_win_is_valid(M.explorer_win) then
    -- Save the current buffer and last directory before hiding
    M.explorer_buf = vim.api.nvim_win_get_buf(M.explorer_win)
    M.save_last_dir()
    vim.api.nvim_win_hide(M.explorer_win)
    return
  end

  -- Save the currently active window before opening explorer
  M.prev_win = vim.api.nvim_get_current_win()

  -- Calculate window size and position
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create or reuse buffer
  if not M.explorer_buf or not vim.api.nvim_buf_is_valid(M.explorer_buf) then
    M.explorer_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(M.explorer_buf, 'bufhidden', 'hide')
  end

  -- Create window
  M.explorer_win = vim.api.nvim_open_win(M.explorer_buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    border = 'rounded',
    title = ' Explorer ',
    title_pos = 'center',
  })

  vim.api.nvim_win_set_option(M.explorer_win, 'winhl', 'Normal:NormalFloat')

  -- Open Netrw at the last visited directory
  vim.cmd('edit ' .. M.last_dir)
end

-- FileType autocommand: applied every time a Netrw buffer is loaded
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()

    -- Keep every netrw buffer alive when the window is hidden
    -- (otherwise sub-directory buffers get wiped and navigation is lost)
    vim.bo[bufnr].bufhidden = 'hide'

    -- <CR>: navigate into directories or open files in the previous window
    vim.keymap.set('n', '<CR>', function()
      local path = vim.fn.expand('<cfile>')
      local curdir = vim.b.netrw_curdir or vim.fn.expand('%:p:h')

      local full_path = curdir
      if not full_path:match("/$") then
        full_path = full_path .. '/'
      end
      full_path = full_path .. path

      if vim.fn.isdirectory(full_path) == 1 then
        -- Navigate into the directory within the floating window
        vim.cmd('edit ' .. full_path)
        return
      end

      -- It's a file: save dir, close explorer and open in the previous window
      M.save_last_dir()
      if M.explorer_win and vim.api.nvim_win_is_valid(M.explorer_win) then
        vim.api.nvim_win_hide(M.explorer_win)
      end

      -- Fallback if previous window is gone
      if M.prev_win and vim.api.nvim_win_is_valid(M.prev_win) then
        vim.api.nvim_set_current_win(M.prev_win)
      end

      vim.cmd('edit ' .. full_path)
    end, { buffer = bufnr, silent = true, noremap = true })

    -- Alt+3 inside explorer closes it
    vim.keymap.set('n', '<A-3>', function()
      M.toggle_explorer()
    end, { buffer = bufnr, silent = true })
  end
})

-- Track last visited directory on every netrw buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == 'netrw' then
      local dir = vim.b.netrw_curdir
      if dir and vim.fn.isdirectory(dir) == 1 then
        M.last_dir = dir
      end
    end
  end,
})

-- Global Alt+3 mapping
vim.keymap.set({'n', 't'}, '<A-3>', function()
  M.toggle_explorer()
end, { desc = "Toggle floating Netrw explorer" })

return M
