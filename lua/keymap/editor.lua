-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Filesytem
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- Close current buffer
vim.keymap.set("n", "q", "<cmd>bdelete<cr><esc><cmd>blast<cr><esc>", { desc = "Delete buffer" })

-- Auto format
vim.keymap.set(
  "n",
  "<A-S-f>",
  function()
    vim.lsp.buf.format { async = false }
  end,
  { desc = "Format buffer" }
)

-- Toggle listchars style
vim.keymap.set(
  "n",
  "<leader>ts",
  function()
    if vim.opt.listchars:get().tab == "» " then
      vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
    else
      vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
    end
  end,
  { desc = "Toggle listchars style" }
)

