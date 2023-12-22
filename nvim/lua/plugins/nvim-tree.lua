-- [ Configure nvim-tree ]
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "󰨃",
					arrow_open = "󰚶",
				}
			}
		}
	}

})
