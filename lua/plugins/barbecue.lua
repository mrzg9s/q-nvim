-- Display LSP-based breadcrumbs
return {
  -- https://github.com/utilyre/barbecue.nvim
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
  -- https://github.com/SmiteshP/nvim-navic
    "SmiteshP/nvim-navic",
  -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
    create_autocmd = false,
  },
  config = function (_, opts)
    require('barbecue').setup(opts)
    vim.opt.updatetime = 200

    vim.api.nvim_create_autocmd({
    "WinResized", -- or WinScrolled on NVIM-v0.8 and lower
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",
    -- include this if you have set `show_modified` to `true`
    -- "BufModifiedSet",
  }, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
      require("barbecue.ui").update()
    end,
  })
  end
}
