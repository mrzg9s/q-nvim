return {
  -- https://github.com/akinsho/toggleterm.nvim
  'akinsho/toggleterm.nvim',
  config = function ()
    require('toggleterm').setup({
      open_mapping = '<C-/>',
      terminal_mappings = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
        -- width = 130,
        -- height = 30,
      },
      shell = '/usr/bin/zsh'
    })
  end
}
