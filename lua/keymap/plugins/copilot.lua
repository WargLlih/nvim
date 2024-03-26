vim.keymap.set(
  'i',
  '<C-right>',
  function()
    require("copilot.suggestion").accept_word()
  end,
  { desc = "Accept word" }
)

vim.keymap.set(
  'i',
  '<S-right>',
  function()
    require("copilot.suggestion").accept(modifier)
  end,
  { desc = "Accept" }
)

vim.keymap.set(
  'i',
  '<C-,>',
  function()
    require("copilot.suggestion").prev()
  end,
  { desc = "Previous" }
)

vim.keymap.set(
  'i',
  '<C-.>',
  function()
    require("copilot.suggestion").next()
  end,
  { desc = "Next" }
)
