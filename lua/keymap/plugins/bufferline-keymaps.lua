vim.keymap.set('n', "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "[B]uffer [P]in" })
vim.keymap.set('n', "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set('n', "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
