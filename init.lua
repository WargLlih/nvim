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
local border = {
  { '┌', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '┐', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '┘', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '└', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

require("lazy").setup("plugins", {
  -- ui config
  ui = {
    border = border,
    size = {
      width = 0.8,
      height = 0.8,
    },
  },

  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

require("bufferline").setup()
require('gitsigns').setup()
vim.notify = require("notify")

-- keymaps
require("keymap.base")
require("keymap.editor")

-- plugins keymaps
require("keymap.plugins.lazy")
require("keymap.plugins.telescope-keymaps")

-- auto cmds
require("auto")


