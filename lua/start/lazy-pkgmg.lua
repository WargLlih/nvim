local base = require("start.settings")

function Start_lazy()
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

function Setup_plugings()
  require('gitsigns').setup()
  require('mini.animate').setup()
end

return {
  Start_lazy = Start_lazy,
  Setup_plugings = Setup_plugings,
}
