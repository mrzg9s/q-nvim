-- Theme/Colorscheme
return {
  -- https://github.com/sainnhe/gruvbox-material
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.cmd.colorscheme('gruvbox-material')
  end,
}
