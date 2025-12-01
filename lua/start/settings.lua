local border = {
  { '┌', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '┐', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '┘', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '└', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

function Set_basic_settings()
  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Make line numbers default
  vim.opt.number = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  vim.opt.mouse = 'a'

  -- Show the current mode
  vim.opt.showmode = true

  -- Sync clipboard between OS and Neovim.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.opt.clipboard = 'unnamedplus'

  -- Enable break indent
  vim.opt.breakindent = true

  -- Save undo history
  vim.opt.undofile = true

  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  -- Sets how neovim will display certain whitespace in the editor.
  --  See :help 'list'
  --  and :help 'listchars'
  vim.opt.list = true
  vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

  -- Preview substitutions live, as you type!
  vim.opt.inccommand = 'split'

  -- Show which line your cursor is on
  -- vim.opt.cursorline = true

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 10

  -- Set the tab settings
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for

  vim.opt.shiftwidth = 2   -- Finally, the third option, shiftwidth manages the indentation
  -- when you use the '>>' or '<<' operators to add or remove
  -- indentation to an already existing line/block of code
  -- Set relative numbers
  vim.opt.relativenumber = true

  -- Set column indicator at 80
  -- vim.opt.colorcolumn = { 80 }

  vim.opt.wrap = true

  vim.opt.foldenable = true

  -- Specify how the border looks like

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { 
      border = border,
      max_width = 80,
      max_height = 20,
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { 
      border = border,
      max_width = 80,
      max_height = 20,
      focusable = false,
    }
  )

  vim.diagnostic.config({
    float = {
      border = border,
      max_width = 80,
      max_height = 20,
      focusable = false,
    },
  })

  vim.opt.termguicolors = true

  -- Enhanced border styling for better visibility
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      -- Set border colors that work with most themes
      vim.api.nvim_set_hl(0, "FloatBorder", { 
        fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Comment")), "fg#"),
        bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg#")
      })
      vim.api.nvim_set_hl(0, "NormalFloat", { 
        bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg#")
      })
    end,
  })
end

return {
  Set_basic_settings = Set_basic_settings,
  border = border,
}
