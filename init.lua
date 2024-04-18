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
require('dap-go').setup()

-- keymaps
require("keymap.base")
require("keymap.editor")

-- plugins keymaps
require("keymap.plugins.lazy")
require("keymap.plugins.telescope-keymaps")
require("keymap.plugins.copilot")
require("keymap.plugins.dap-ui")

-- auto cmds
require("auto")
