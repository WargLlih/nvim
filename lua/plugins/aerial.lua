-- Aerial: Navegação por símbolos do código
-- Este plugin cria uma janela lateral mostrando todos os símbolos (funções, classes, etc.)
-- do arquivo atual, permitindo navegação rápida e visualização da estrutura do código.
-- Funcionalidades:
-- - Janela lateral com símbolos do arquivo
-- - Navegação rápida entre símbolos
-- - Suporte a múltiplas linguagens via LSP e Treesitter
-- - Keymaps para toggle, navegação e fechamento
return {
  "stevearc/aerial.nvim",
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Aerial (Symbols)" },
    { "<leader>o", "<cmd>AerialOpen<CR>", desc = "Aerial Open" },
    { "<leader>c", "<cmd>AerialClose<CR>", desc = "Aerial Close" },
    { "<leader>n", "<cmd>AerialNext<CR>", desc = "Aerial Next" },
    { "<leader>p", "<cmd>AerialPrev<CR>", desc = "Aerial Prev" },
  },
  opts = {
    attach_mode = "window",
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 10,
      win_opts = {},
      preserve_equality = false,
    },
    show_guides = true,
    guides = {
      mid_item = "├─",
      last_item = "└─",
      nested_top = "│ ",
      whitespace = "  ",
    },
    keymaps = {
      ["?"] = "actions.show_help",
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["p"] = "actions.scroll",
      ["<C-j>"] = "actions.down_and_scroll",
      ["<C-k>"] = "actions.up_and_scroll",
      ["{"] = "actions.prev",
      ["}"] = "actions.next",
      ["[["] = "actions.prev_up",
      ["]]"] = "actions.next_up",
      ["q"] = "actions.close",
      ["o"] = "actions.tree_toggle",
      ["za"] = "actions.tree_toggle",
      ["O"] = "actions.tree_toggle_recursive",
      ["zA"] = "actions.tree_toggle_recursive",
      ["l"] = "actions.tree_open",
      ["zo"] = "actions.tree_open",
      ["L"] = "actions.tree_open_recursive",
      ["zO"] = "actions.tree_open_recursive",
      ["h"] = "actions.tree_close",
      ["zc"] = "actions.tree_close",
      ["H"] = "actions.tree_close_recursive",
      ["zC"] = "actions.tree_close_recursive",
      ["zr"] = "actions.tree_increase_fold_level",
      ["zR"] = "actions.tree_open_all",
      ["zm"] = "actions.tree_decrease_fold_level",
      ["zM"] = "actions.tree_close_all",
      ["zx"] = "actions.tree_sync_folds",
      ["zX"] = "actions.tree_sync_folds",
    },
  },
}
