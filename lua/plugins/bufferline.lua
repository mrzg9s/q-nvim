return {
  -- https://github.com/akinsho/bufferline.nvim
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = 'nvim_lsp',
        max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 10,
				show_tab_indicators = true,
				--[[ indicator = {
					style = "underline",
				}, ]]
        enforce_regular_tabs = false,
				view = "multiwindow",
				show_buffer_close_icons = true,
				separator_style = "thin",
				-- separator_style = "slant",
				always_show_bufferline = true,
				themable = true,

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end
      },


    })
  end
}
