-- Remove all notifications
vim.keymap.set(
  "n",
  "<leader>nc",
  function()
    require("notify").dismiss({ silent = true, pending = true })
  end,
  { desc = "[N]otifications [C]lose" }
)
