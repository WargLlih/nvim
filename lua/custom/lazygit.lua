-- Lazygit: Git interface with floating window toggle
-- This plugin provides a persistent lazygit terminal that can be toggled
-- without losing the git session. The process continues running in the background.

-- Global variables to track lazygit window
vim.g.lazygit_win = nil
vim.g.lazygit_buf = nil

-- Global variables to track terminal window
vim.g.terminal_win = nil
vim.g.terminal_buf = nil
    
    -- Open lazygit with Alt+1 in floating window (toggle)
    vim.keymap.set({"n", "t"}, "<A-1>", function()
      -- If window exists and is valid, hide it (keep process running)
      if vim.g.lazygit_win and vim.api.nvim_win_is_valid(vim.g.lazygit_win) then
        vim.api.nvim_win_hide(vim.g.lazygit_win)
        print("Lazygit window hidden (process still running)")
        return
      end
      
      -- If window exists but is hidden, show it again
      if vim.g.lazygit_win then
        -- Recreate the window with the same buffer
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local col = math.floor((vim.o.columns - width) / 2)
        local row = math.floor((vim.o.lines - height) / 2)
        
        local win = vim.api.nvim_open_win(vim.g.lazygit_buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          col = col,
          row = row,
          border = 'rounded',
          title = ' Lazygit ',
          title_pos = 'center',
        })
        vim.g.lazygit_win = win
        vim.cmd('startinsert')
        print("Lazygit window shown")
        return
      end
      
      -- Create new floating window
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)
      
      -- Create buffer
      local buf = vim.api.nvim_create_buf(false, true)
      vim.g.lazygit_buf = buf
      
      -- Create window
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        border = 'rounded',
        title = ' Lazygit ',
        title_pos = 'center',
      })
      vim.g.lazygit_win = win
      
      -- Set up terminal
      vim.fn.termopen('lazygit', {
        on_exit = function()
          -- Only clean up if window is still valid (not hidden)
          if vim.g.lazygit_win and vim.api.nvim_win_is_valid(vim.g.lazygit_win) then
            vim.api.nvim_win_close(vim.g.lazygit_win, true)
          end
          if vim.g.lazygit_buf and vim.api.nvim_buf_is_valid(vim.g.lazygit_buf) then
            vim.api.nvim_buf_delete(vim.g.lazygit_buf, { force = true })
          end
          vim.g.lazygit_win = nil
          vim.g.lazygit_buf = nil
          print("Lazygit process exited")
        end
      })
      
      -- Start insert mode
      vim.cmd('startinsert')
      print("Lazygit window opened")
    end, { desc = "Toggle lazygit floating window" })

    -- Force close lazygit window and kill process
    vim.keymap.set("n", "<leader>lg", function()
      if vim.g.lazygit_win and vim.api.nvim_win_is_valid(vim.g.lazygit_win) then
        vim.api.nvim_win_close(vim.g.lazygit_win, true)
      end
      if vim.g.lazygit_buf and vim.api.nvim_buf_is_valid(vim.g.lazygit_buf) then
        vim.api.nvim_buf_delete(vim.g.lazygit_buf, { force = true })
      end
      vim.g.lazygit_win = nil
      vim.g.lazygit_buf = nil
      print("Lazygit window and process force closed")
    end, { desc = "Force close lazygit window and process" })
    
    -- Debug function to check lazygit status
    vim.keymap.set("n", "<leader>ld", function()
      print("Lazygit window:", vim.g.lazygit_win)
      print("Lazygit buffer:", vim.g.lazygit_buf)
      if vim.g.lazygit_win then
        print("Window valid:", vim.api.nvim_win_is_valid(vim.g.lazygit_win))
      end
      if vim.g.lazygit_buf then
        print("Buffer valid:", vim.api.nvim_buf_is_valid(vim.g.lazygit_buf))
      end
    end, { desc = "Debug lazygit status" })

    -- Open terminal with Alt+2 in floating window (toggle)
    vim.keymap.set({"n", "t"}, "<A-2>", function()
      -- If window exists and is valid, hide it (keep process running)
      if vim.g.terminal_win and vim.api.nvim_win_is_valid(vim.g.terminal_win) then
        vim.api.nvim_win_hide(vim.g.terminal_win)
        print("Terminal window hidden (process still running)")
        return
      end
      
      -- If window exists but is hidden, show it again
      if vim.g.terminal_win then
        -- Recreate the window with the same buffer
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local col = math.floor((vim.o.columns - width) / 2)
        local row = math.floor((vim.o.lines - height) / 2)
        
        local win = vim.api.nvim_open_win(vim.g.terminal_buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          col = col,
          row = row,
          border = 'rounded',
          title = ' Terminal ',
          title_pos = 'center',
        })
        vim.g.terminal_win = win
        vim.cmd('startinsert')
        print("Terminal window shown")
        return
      end
      
      -- Create new floating window
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)
      
      -- Create buffer
      local buf = vim.api.nvim_create_buf(false, true)
      vim.g.terminal_buf = buf
      
      -- Create window
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        border = 'rounded',
        title = ' Terminal ',
        title_pos = 'center',
      })
      vim.g.terminal_win = win
      
      -- Set up terminal with default shell
      local shell = vim.o.shell
      vim.fn.termopen(shell, {
        on_exit = function()
          -- Only clean up if window is still valid (not hidden)
          if vim.g.terminal_win and vim.api.nvim_win_is_valid(vim.g.terminal_win) then
            vim.api.nvim_win_close(vim.g.terminal_win, true)
          end
          if vim.g.terminal_buf and vim.api.nvim_buf_is_valid(vim.g.terminal_buf) then
            vim.api.nvim_buf_delete(vim.g.terminal_buf, { force = true })
          end
          vim.g.terminal_win = nil
          vim.g.terminal_buf = nil
          print("Terminal process exited")
        end
      })
      
      -- Start insert mode
      vim.cmd('startinsert')
      print("Terminal window opened")
    end, { desc = "Toggle terminal floating window" })
