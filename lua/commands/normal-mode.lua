local function normalMode()
  vim.api.nvim_create_user_command('NormalMode', function()
    -- set on cmp
    local cmp = require('cmp')
    cmp.setup {
      enabled = false,
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = function() end,
        ['<C-p>'] = function() end,
        ['<C-y>'] = function() end,
        ['<C-Space>'] = cmp.mapping.complete {},
      },
    }

    vim.notify("You are in NormalMode", vim.log.levels.INFO)
  end, {})
end

return {
  normalMode = normalMode
}
