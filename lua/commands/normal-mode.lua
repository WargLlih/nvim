local function normalMode()
  vim.api.nvim_create_user_command('NormalMode', function()
    -- set off cmp
    local cmp = require('cmp')
    cmp.setup {
      enabled = false,
      mapping = {
        ['<C-n>'] = function() end,
        ['<C-p>'] = function() end,
        ['<C-y>'] = function() end,
        ['<C-Space>'] = function() end,
      }
    }

    -- set off IA
    vim.cmd('Copilot disable')

    vim.notify("Completion disabled", vim.log.levels.INFO)
  end, {})
end

return {
  normalMode = normalMode
}
