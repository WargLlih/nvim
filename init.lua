require("basic_settings")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup("plugins")

-- using kanagawa
vim.cmd("colorscheme kanagawa-dragon")

-- lualine setup
require('lualine').setup({
  options = { theme = 'codedark' }
})

-- bufferline setup
vim.opt.termguicolors = true
require("bufferline").setup {}

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   buffer = buffer,
--   callback = function()
--     vim.lsp.buf.format { async = false }
--   end
-- })

-- keymaps
require("keymap.base")
require("keymap.editor")

-- plugins keymaps
require("keymap.plugins.lazy")
require("keymap.plugins.notify")
require("keymap.plugins.telescope-keymaps")
require("keymap.plugins.bufferline-keymaps")
require("keymap.plugins.copilot")
