-- Comment/Uncomment Lines of Code
return {
    -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
        ---Add a space b/w comment and the line
        padding = true,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = '<leader>ccl',
          ---Block-comment toggle keymap
          block = '<leader>ccb',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = '<leader>cl',
          ---Block-comment keymap
          block = '<leader>cb',
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = '<leader>cO',
          ---Add comment on the line below
          below = '<leader>co',
          ---Add comment at the end of line
          eol = '<leader>cA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
    },
    config = function(_, opts)
        require('Comment').setup(opts)
    end

}
