-- [ Configure nvim-tree ]
require('nvim-tree').setup({})
vim.keymap.set('n', '<A-1>', function()
	local nvim_tree = require('nvim-tree.api')
	local current_buf = vim.api.nvim_get_current_buf()
	local current_buf_ft = vim.api.nvim_get_option_value('filetype', { buf = current_buf })
	if current_buf_ft == 'NvimTree' then
		nvim_tree.tree.toggle()
	else
		nvim_tree.tree.focus()
	end
end)

