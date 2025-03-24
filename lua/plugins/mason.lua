local base = require("start.settings")

return {
  "williamboman/mason.nvim",
  opt = {
    ensure_installed = {
      "gopls",
      "lua_ls",
    }
  }
}
