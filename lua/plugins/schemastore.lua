-- SchemaStore: Suporte a JSON schemas
-- Este plugin fornece schemas JSON para validação e autocompletar em arquivos JSON,
-- melhorando a experiência de desenvolvimento com arquivos de configuração.
-- Funcionalidades:
-- - Schemas JSON para validação
-- - Autocompletar baseado em schemas
-- - Suporte a arquivos de configuração comuns
-- - Integração com LSP JSON
return {
  "b0o/SchemaStore.nvim",
  lazy = true,
  version = false, -- last release is way too old and doesn't work on Neovim 0.10+
}
