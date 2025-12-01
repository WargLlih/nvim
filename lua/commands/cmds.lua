function EasyMode()
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

    vim.notify("You are in EasyMode >.<", vim.log.levels.INFO)
  end, {})
end

function HardMode()
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

    vim.notify("You are in HardMode. Good Luck!", vim.log.levels.INFO)
  end, {})
end

function NormalMode()
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
  EasyMode = EasyMode,
  HardMode = HardMode,
  NormalMode = NormalMode,
}
