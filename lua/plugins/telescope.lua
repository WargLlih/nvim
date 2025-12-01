-- Telescope: Fuzzy finder and picker
-- Telescope é um fuzzy finder extensível que permite buscar arquivos, texto, símbolos, etc.
-- Funcionalidades:
-- - Busca fuzzy de arquivos
-- - Busca de texto no projeto
-- - Navegação de símbolos
-- - Integração com LSP
-- - Múltiplos pickers e extensões
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",             desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",               desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",             desc = "Help tags" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",  desc = "Document symbols" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>",        desc = "References" },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>",       desc = "Definitions" },
    { "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>",  desc = "Type definitions" },
    { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>",   desc = "Implementations" },
    { "<leader>fR", "<cmd>Telescope resume<cr>",                desc = "Resume last search" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.delete_buffer,
          },
          n = {
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.delete_buffer,
          },
        },
        file_ignore_patterns = {
          "%.git/",
          "%.DS_Store",
          "node_modules/",
          "%.pyc",
          "%.class",
          "%.jar",
          "%.war",
          "%.ear",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
          no_ignore_parent = false,
        },
        live_grep = {
          only_sort_text = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Load extensions safely
    local ok, _ = pcall(telescope.load_extension, "fzf")
    if not ok then
      vim.notify("telescope-fzf-native not available, using default sorting", vim.log.levels.WARN)
    end
  end,
}
