-- Basic stuffs
require("start.settings").Set_basic_settings()

-- Setup plugings
require("start.lazy-pkgmg").Start_lazy()
require("start.lazy-pkgmg").Setup_plugings()

-- My keymaps
require("keymap.general").Quality_of_life()
require("keymap.general").Editor()

-- Custom modules
require("custom.lazygit")
require("custom.explorer")

-- Auto functions
require("auto.cmd").Text_highlight()

-- Commands
require("commands.cmds").EasyMode()
require("commands.cmds").NormalMode()
require("commands.cmds").HardMode()


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

