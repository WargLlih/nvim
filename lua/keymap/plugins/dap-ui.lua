vim.keymap.set(
  "n",
  "<leader>dt",
  function()
    require("dapui").toggle()
  end,
  { desc = "[D]ebugger [T]oggle" }
)

vim.keymap.set(
  "n",
  "<leader>db",
  ":DapToggleBreakpoint<cr>",
  { desc = "[D]ebugger [B]reakpoint" }
)

vim.keymap.set(
  "n",
  "<leader>dc",
  ":DapContinue<cr>",
  { desc = "[D]ebugger [C]ontinue" }
)

vim.keymap.set(
  "n",
  "<leader>dr",
  function()
    require('dapui').open({ reset = true })
  end,
  { desc = "[D]ebugger [R]eset" }
)

vim.keymap.set(
  "n",
  "<leader>dn",
  ":DapStepOver<cr>",
  { desc = "[D]ebugger [N]ext" }
)

vim.keymap.set(
  "n",
  "<leader>di",
  ":DapStepOver<cr>",
  { desc = "[D]ebugger [I]nto" }
)

vim.keymap.set(
  "n",
  "<leader>do",
  ":DapStepOver<cr>",
  { desc = "[D]ebugger [O]ut" }
)
