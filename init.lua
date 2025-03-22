local start = require("start")
local auto = require("auto")
local keymap = require("keymap")
local commands = require("commands")

-- Basic stuffs
start.settings.set_basic_settings()

-- Setup plugings
start.lazy.start_lazy()
start.lazy.setup_plugings()

-- My keymaps
keymap.general.quality_of_life()
keymap.general.editor()
keymap.plugins.telescope.telescope()
keymap.plugins.tree.toogle_tree()

-- Auto functions
auto.text_highlight()

-- Commands
commands.CreateEasyMode()
commands.CreateNormalMode()
commands.CreateHardMode()
