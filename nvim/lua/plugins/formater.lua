require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.TRACE,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		xml = { require("formatter.filetypes.xml").xmlformat },
		java = { require("formatter.filetypes.java").google_java_format },
	},
})
