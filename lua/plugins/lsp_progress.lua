-- Fidget: Indicador de progresso do LSP
-- Este plugin mostra o progresso das operações do LSP (como indexação, análise)
-- em uma interface discreta, informando sobre o status das operações em background.
-- Funcionalidades:
-- - Indicador de progresso do LSP
-- - Notificações discretas de status
-- - Configuração de aparência e comportamento
-- - Integração automática com servidores LSP
return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  event = "LspAttach",
  opts = {
    text = {
      spinner = "dots",
    },
    window = {
      relative = "editor",
      blend = 0,
      border = "rounded",
    },
    timer = {
      spinner_rate = 125,
      fidget_decay = 2000,
      task_decay = 1000,
    },
    fmt = {
      leftpad = true,
      stack_upwards = true,
      function_or_method = "",
      truncate = true,
    },
    sources = {
      ["null-ls"] = {
        ignore = true,
      },
    },
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
}
