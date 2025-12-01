-- Lint: Linting automático em tempo real
-- Este plugin executa linters específicos para cada linguagem e mostra os problemas
-- em tempo real no editor.
-- Funcionalidades:
-- - Linting automático ao abrir/editar arquivos
-- - Suporte a múltiplas linguagens (Lua, Python, JS/TS, JSON, YAML, etc.)
-- - Keymap <leader>l para executar linting manual
-- - Integração com sistema de diagnósticos do Neovim
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Function to check if a linter is available
    local function is_linter_available(linter_name)
      return vim.fn.executable(linter_name) == 1
    end

    -- Configure linters by file type, checking availability
    lint.linters_by_ft = {
      lua = is_linter_available("luacheck") and { "luacheck" } or {},
      python = (function()
        local python_linters = {}
        if is_linter_available("pylint") then
          table.insert(python_linters, "pylint")
        end
        if is_linter_available("flake8") then
          table.insert(python_linters, "flake8")
        end
        -- Fallback to basic Python syntax checking if no linters available
        if #python_linters == 0 then
          vim.notify("No Python linters found. Install pylint or flake8 for better Python linting.", vim.log.levels.WARN)
        end
        return python_linters
      end)(),
      javascript = is_linter_available("eslint_d") and { "eslint_d" } or {},
      typescript = is_linter_available("eslint_d") and { "eslint_d" } or {},
      json = is_linter_available("jsonlint") and { "jsonlint" } or {},
      yaml = is_linter_available("yamllint") and { "yamllint" } or {},
      markdown = is_linter_available("markdownlint") and { "markdownlint" } or {},
      sh = is_linter_available("shellcheck") and { "shellcheck" } or {},
      bash = is_linter_available("shellcheck") and { "shellcheck" } or {},
      c = is_linter_available("cppcheck") and { "cppcheck" } or {},
      cpp = is_linter_available("cppcheck") and { "cppcheck" } or {},
    }

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Only try linting if there are linters configured for this file type
        local filetype = vim.bo.filetype
        if lint.linters_by_ft[filetype] and #lint.linters_by_ft[filetype] > 0 then
          pcall(lint.try_lint)
        end
      end,
    })

    -- Keymaps for linting
    vim.keymap.set("n", "<leader>l", function()
      local filetype = vim.bo.filetype
      if lint.linters_by_ft[filetype] and #lint.linters_by_ft[filetype] > 0 then
        pcall(lint.try_lint)
      else
        vim.notify("No linters configured for filetype: " .. filetype, vim.log.levels.INFO)
      end
    end, { desc = "Trigger linting for current file" })
  end,
}
