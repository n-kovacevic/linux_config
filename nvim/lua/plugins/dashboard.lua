require('dashboard').setup {
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
            { desc = ' New file', group = 'RainbowGreen', action = 'Scratch', key = 'n', },
            { desc = ' Open file', group = 'RainbowCyan', action = 'ScratchOpen', key = 'o', },
            { desc = ' ScratchPad', group = 'RainbowYellow', action = 'ScratchPad', key = 'p', },
			{ desc = '󰊳 Update', group = 'RainbowViolet', action = 'Lazy update', key = 'u' },
			{ desc = ' Files', group = 'RainbowOrange', action = 'Telescope find_files', key = 'f', },
		}
	}
}
