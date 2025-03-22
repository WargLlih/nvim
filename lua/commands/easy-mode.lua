local function easyMode()
  vim.api.nvim_create_user_command('EasyMode', function()
    -- set on cmp
    local cmp = require('cmp')
    cmp.setup {
      enabled = true,
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
      },
    }

    -- set on IA
    vim.cmd('Copilot enable')

    vim.notify("You are in EasyMode >.<", vim.log.levels.INFO)
  end, {})
end

return {
  easyMode = easyMode
}
