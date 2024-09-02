-- Status line
return {
  -- https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- fancy icons
    -- https://github.com/linrongbin16/lsp-progress.nvim
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  config = function()
    require('lsp-progress').setup({})
    require('lualine').setup {
      options = {
        -- fmt = string.lower,
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        -- Filetypes to disable lualine for.
        disabled_filetypes = {
          -- only ignores the ft for statusline.
          statusline = {},
          -- only ignores the ft for winbar.
          winbar = {},
        },
        -- make statusline inactive for following data types
        ignore_focus = {},
        -- a b c won't take the entire statusline
        always_divide_middle = true,
        -- if set to false every widnow will have its own statusnbar
        globalstatus = true,
        -- refresh time in ms
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          'filename',
          'searchcount',
          'selectioncount',
          function ()
            return require('lsp-progress').progress()
          end
        },

        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress', 'filesize' },
        lualine_z = { 'location' }
      },
      -- I have no idea what it is needed for
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {'location'},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }

    -- listen lsp-progress event and refresh lualine
    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })

  end
}
