-- [ Configure nvim-tree ]
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "󰨃",
					arrow_open = "󰚶",
				},
			},
			git_placement = "signcolumn",
		},
        highlight_git = true,
        highlight_opened_files = "icon",
		group_empty = true,
		indent_markers = {
			enable = true,
		},
	},
	filters = { custom = { "^.git$" } },
})
-- vim.api.nvim_command('hi NvimTreeNormal guibg=none')
