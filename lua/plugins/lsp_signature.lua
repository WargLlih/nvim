-- LSP Signature: Assinaturas de funções em tempo real
-- Este plugin mostra automaticamente a assinatura de funções enquanto você digita,
-- incluindo parâmetros, tipos e documentação, melhorando a experiência de desenvolvimento.
-- Funcionalidades:
-- - Assinaturas automáticas ao digitar
-- - Documentação inline de parâmetros
-- - Suporte a múltiplas linguagens
-- - Configuração de aparência e comportamento
return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = true,
    hint_prefix = "● ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 120,
    wrap = true,
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 1,
    floating_window_off_y = 0,
    close_timeout = 4000,
    fix_pos = false,
    hint_inline = function()
      return false
    end,
    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,
    padding = "",
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = "Black",
    timer_interval = 200,
    toggle_key = nil,
    select_signature_key = nil,
    move_cursor_key = nil,
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
