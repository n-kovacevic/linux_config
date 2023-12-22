local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
	'tpope/vim-fugitive',
	--  'tpope/vim-rhubarb', -- GitHub extension
	'tpope/vim-sleuth', -- Auto adjust shiftwidth and expandtab

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'L3MON4D3/LuaSnip',
		}
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'j-hui/fidget.nvim',
			'folke/neodev.nvim',
		},
	},

	{
		'EdenEast/nightfox.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'carbonfox'
		end,
	},

	{
		'nanozuki/tabby.nvim',
		opts = {},
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			}
		},
	},

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {},
	},

	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = 'hyper',
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
						{ desc = ' Files', group = 'Label', action = 'Telescope find_files', key = 'f', },
						--	{ desc = ' Apps', group = 'Character', action = 'Telescope app', key = 'a', },
						--	{ desc = ' dotfiles', group = 'Number', action = 'Telescope dotfiles', key = 'd', },
					}
				}
			}
		end,
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},

	-- {
	--"Shatur/neovim-session-manager",
	--opts = {}
	--}
	{
		'nvim-treesitter/nvim-treesitter',
		opts = {}
	},

	{
		'nvim-tree/nvim-tree.lua',
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {}
	},

	{
		"LintaoAmons/scratch.nvim",
		event = "VeryLazy",
	},

}, {})
