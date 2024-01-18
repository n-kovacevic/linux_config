local lualine = require("lualine")
local theme = require("lualine.themes.auto")
theme.normal.c.bg = 'none'
lualine.setup({
	options = {
        theme = theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			-- statusline = {'NvimTree'},
			-- winbar = {'NvimTree'}
		},
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
})
