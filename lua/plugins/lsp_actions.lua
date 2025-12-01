-- Actions Preview: Preview de code actions com interface visual
-- Este plugin fornece uma interface visual para preview e execução de code actions,
-- mostrando as mudanças antes de aplicá-las, melhorando a experiência de desenvolvimento.
-- Funcionalidades:
-- - Preview visual de code actions
-- - Interface para seleção e execução
-- - Suporte a múltiplos backends (telescope, nui)
-- - Keymap <leader>ca para acessar code actions
return {
  "aznhe21/actions-preview.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ca", function()
      require("actions-preview").code_actions()
    end, desc = "Code actions" },
  },
  opts = {
    highlight = {
      cursor = "Cursor",
      selection = "Visual",
    },
    backend = { "telescope", "nui" },
    nui = {
      dir = "row",
      position = { row = 1, col = 0 },
      size = { width = 60, height = 10 },
      border = {
        style = "rounded",
        text = {
          top = " Code Actions ",
          top_align = "center",
        },
      },
      buf_options = {
        filetype = "actions-preview",
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    telescope = {
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = "top",
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    },
  },
}