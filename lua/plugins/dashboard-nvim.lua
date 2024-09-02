-- Startup dashboard
return {
  -- https://github.com/nvimdev/dashboard-nvim
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        disable_move = true,
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u'
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Lazy',
            group = '@property',
            action = 'Lazy',
            key = 'l',
          },
        },
      },
    }
  end,
  -- https://github.com/nvim-tree/nvim-web-devicons
  dependencies = { {'nvim-tree/nvim-web-devicons' } }
}
