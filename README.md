# q-nvim

> **DISCLAIMER:** 
> These configurations are based on my personal dev setup.
> I take no responsibility.
> Proceed at your own risk!
>
> LSP CONFIGS NOT MINE
> CAN BE SOME TROUBLE WITH KEYMAPS

My NeoVim setup.

## Prerequisites
- [Neovim](https://neovim.io/) - Version 0.9.1 or later
- [Nerd Font](https://www.nerdfonts.com/) - Needed to see nice icons in Neovim
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Needed for Telescope Fuzzy Finder
- [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) - Needed for system clipboard support
- [npm/node](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) - Needed for some LSP servers (see commented lines in [nvim-lspconfig.lua](.config/nvim/lua/plugins/nvim-lspconfig.lua))

## Setup
```bash
git clone https://github.com/mrzg9s/q-nvim
mv q-nvim/* ~/.config/nvim/
```

## Plugins
- [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [https://github.com/folke/noice.nvim](https://github.com/folke/noice.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

## Keymapping
<details>
  <summary>Tap me!</summary>
```lua
vim.g.mapleader = " "
local keymap = vim.keymap
-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller
-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
-- Diff keymaps
keymap.set("n", "<leader>dc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>d1", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>d3", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>dn", "]c") -- next diff hunk
keymap.set("n", "<leader>dp", "[c") -- previous diff hunk
-- Bufferline 
keymap.set('n', '<leader>tp', '<CMD>BufferLinePick<CR>') -- tab pick
keymap.set('n', '<leader>tc', '<CMD>BufferLinePickClose<CR>') -- tab close
keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>') -- select next tab
keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>') -- select previous tab
keymap.set('n', '<leader>tmn', '<CMD>BufferLineMoveNext<CR>') -- move tab next
keymap.set('n', '<leader>tmp', '<CMD>BufferLineMovePrev<CR>') -- move tab previous
keymap.set('n', '<leader>ts', '<CMD>BufferLineSortByDirectory<CR>') -- sort tab by dir
-- Telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() builtin.treesitter({default_text=":method:"}) end)
local harpoon_ui = require("harpoon.ui")
-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu)
keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end)
keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end)
keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end)
keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end)
keymap.set("n", "<leader>h5", function() harpoon_ui.nav_file(5) end)
keymap.set("n", "<leader>h6", function() harpoon_ui.nav_file(6) end)
keymap.set("n", "<leader>h7", function() harpoon_ui.nav_file(7) end)
keymap.set("n", "<leader>h8", function() harpoon_ui.nav_file(8) end)
keymap.set("n", "<leader>h9", function() harpoon_ui.nav_file(9) end)
-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer
-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')
-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)
```
</details>

## TODO
- Reorg structure
- Better lsp config
- Make troubleshooting

## Troubleshooting
There may be no problems yet...

## Useful links
- [Awesome NeoVim](https://github.com/rockerBOO/awesome-neovim)
- [NeoVim Starter Kit](https://github.com/bcampolo/nvim-starter-kit)

