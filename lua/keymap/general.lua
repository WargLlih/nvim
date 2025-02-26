function quality_of_life()
  -- Set highlight on search, but clear on pressing <Esc> in normal mode
  vim.opt.hlsearch = true
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- save file
  vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

  -- restart LSP
  vim.keymap.set("n", "<A-S-l>", "<cmd>LspRestart<cr><esc>", { desc = "Restart LSP" })

  -- Abre um terminal em um novo buffer
  -- vim.keymap.set('n', '<leader>k', ':tab term<CR>', { noremap = true, silent = true })
  -- vim.keymap.set('t', '<S-esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
end

function editor()
  -- Move Lines
  vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

  -- Move in insert mode
  vim.keymap.set("i", "<C-h>", "<left>", { desc = "Move left in insert mode" })
  vim.keymap.set("i", "<C-l>", "<right>", { desc = "Move right in insert mode" })
  vim.keymap.set("i", "<C-j>", "<down>", { desc = "Move down in insert mode" })
  vim.keymap.set("i", "<C-k>", "<up>", { desc = "Move up in insert mode" })

  -- Tab control
  -- vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { desc = "[T]ab [N]ew" })
  -- vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "[T]ab [C]lose" })
  -- vim.keymap.set("n", "<Tab>", ":tabnext<cr>", { desc = "Next tab" })
  -- vim.keymap.set("n", "<S-Tab>", ":tabprevious<cr>", { desc = "Previous tab" })

  -- Buffer control
  vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "[Q]uit" })
  vim.keymap.set("n", "<S-h>", ":bp<cr>", { desc = "Previous buffer" })
  vim.keymap.set("n", "<S-l>", ":bn<cr>", { desc = "Next buffer" })

  -- Error / Warn seek
  vim.keymap.set("n", "g]", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

  -- Auto format
  vim.keymap.set(
    "n",
    "<A-S-f>",
    function()
      vim.lsp.buf.format { async = false }
      vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end,
    { desc = "Format buffer" }
  )

  -- Toggle listchars style
  vim.keymap.set(
    "n",
    "<leader>ts",
    function()
      if vim.opt.listchars:get().tab == "» " then
        vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
      else
        vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
      end
    end,
    { desc = "Toggle listchars style" }
  )
end

return {
  quality_of_life = quality_of_life,
  editor = editor
}
