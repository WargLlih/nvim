# nvim
Based on kickstart.nvim

## Funcionalidades de LSP

Este projeto agora inclui uma configuração moderna e completa de LSP (Language Server Protocol) com as seguintes funcionalidades:

### 🔧 Servidores LSP Configurados
- **Lua**: lua_ls
- **Python**: pyright
- **C/C++**: clangd
- **HTML**: html
- **CSS**: cssls
- **TypeScript/JavaScript**: tsserver
- **JSON**: jsonls
- **YAML**: yamlls
- **Bash**: bashls
- **Markdown**: marksman

### 🛠️ Plugins de LSP
- **Mason**: Gerenciamento de servidores LSP
- **Conform**: Formatação automática
- **Lint**: Linting automático
- **LSP Inlay Hints**: Dicas inline
- **Aerial**: Navegação por símbolos
- **Trouble**: Visualização de problemas
- **LSP Lines**: Erros inline
- **LSP Signature**: Assinaturas de funções
- **Fidget**: Progresso do LSP
- **Lightbulb**: Code actions
- **Actions Preview**: Preview de code actions

### ⌨️ Keymaps Principais
- `<leader>ca` - Code actions
- `<leader>cr` - Rename
- `<leader>cf` - Format
- `K` - Hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - References
- `<leader>D` - Type definition
- `<leader>ds` - Show diagnostic
- `<leader>dl` - Diagnostic loclist
- `<leader>dw` - Diagnostic quickfix
- `g]` - Next diagnostic
- `g[` - Previous diagnostic

### 🎯 Funcionalidades Especiais
- **Formatação automática** ao salvar arquivos
- **Linting automático** em tempo real
- **Inlay hints** para TypeScript/JavaScript
- **Navegação por símbolos** com Aerial
- **Visualização de problemas** com Trouble
- **Erros inline** com LSP Lines
- **Assinaturas de funções** em tempo real
- **Progresso do LSP** com Fidget
- **Code actions** com preview
