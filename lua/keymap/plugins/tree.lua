function toogle_tree()
  vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
end

return {
  toogle_tree = toogle_tree
}
