-- LSP Lines: Erros e warnings mostrados inline
-- Este plugin substitui os sinais de diagnóstico tradicionais por linhas virtuais
-- que mostram os problemas diretamente no código, proporcionando melhor visibilidade.
-- Funcionalidades:
-- - Linhas virtuais para erros e warnings
-- - Melhor visibilidade dos problemas
-- - Keymap <leader>ll para toggle
-- - Integração com sistema de diagnósticos do LSP
return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  keys = {
    { "<leader>ll", function()
      require("lsp_lines").toggle()
    end, desc = "Toggle LSP lines" },
  },
  config = function()
    require("lsp_lines").setup()
  end,
}
