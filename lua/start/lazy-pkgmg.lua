local base = require("start.settings")

function start_lazy()
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

  require("lazy").setup("plugins", {
    -- ui config
    ui = {
      border = base.border,
      size = {
        width = 0.8,
        height = 0.8,
      },
    },

    checker = {
      enabled = true,
      notify = true,
    },
    change_detection = {
      notify = true,
    },
  })
end

function setup_plugings()
  require('gitsigns').setup()

  vim.notify = require("notify")

  require('mini.animate').setup()

  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      },
      border = base.border,
    }
  })
end

return {
  start_lazy = start_lazy,
  setup_plugings = setup_plugings
}
