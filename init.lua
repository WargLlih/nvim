require("keymap.base")
require("basic_settings")

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

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


require("lazy").setup("plugins")

vim.cmd("colorscheme kanagawa-dragon")

require("keymap.telescope")
require("copilot.suggestion").toggle_auto_trigger()
require('lualine').setup()
