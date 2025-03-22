local function hardMode()
  vim.api.nvim_create_user_command('HardMode', function()
    -- set off cmp
    local cmp = require('cmp')
    cmp.setup {
      enabled = false,
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = function() end,
        ['<C-p>'] = function() end,
        ['<C-y>'] = function() end,
        ['<C-Space>'] = function() end,
      }
    }

    -- set off IA
    vim.cmd('Copilot disable')

    vim.notify("You are in HardMode. Good Luck!", vim.log.levels.INFO)
  end, {})
end

return {
  hardMode = hardMode
}
