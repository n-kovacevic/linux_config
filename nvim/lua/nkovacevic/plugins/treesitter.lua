return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"lua",
				"groovy",
				"bash",
				"json",
				"yaml",
				"html",
				"css",
				"markdown",
				"dockerfile",
				"gitignore",
				"vimdoc",
				"java",
				"gitcommit",
				"pem",
				"sql",
				"ssh_config",
				"terraform",
				"xml",
			},
		})
	end,
}
