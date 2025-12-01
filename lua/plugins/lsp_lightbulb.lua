-- Lightbulb: Indicador visual de code actions disponíveis
-- Este plugin mostra um ícone de lâmpada quando há code actions disponíveis
-- na posição do cursor, facilitando a descoberta de ações automáticas.
-- Funcionalidades:
-- - Ícone visual de code actions disponíveis
-- - Integração com sistema de code actions do LSP
-- - Configuração de aparência e comportamento
-- - Ativação automática em buffers com LSP
return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  opts = {
    autocmd = {
      enabled = true,
    },
    sign = {
      enabled = true,
      priority = 10,
    },
    virtual_text = {
      enabled = true,
      text = "💡",
      hl_mode = "replace",
    },
    status_text = {
      enabled = true,
      text = "💡",
      text_unavailable = "",
    },
  },
  config = function(_, opts)
    require("nvim-lightbulb").setup(opts)
  end,
}
