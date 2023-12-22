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

-- Disable mouse
vim.o.mouse = ''

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable clipboard
vim.o.clipboard = 'unnamedplus'

-- Enable breakindent (better word wrap)
vim.o.breakindent = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure tabbing
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab = true

-- Disable search highlighting
vim.o.hlsearch = false

-- Enable term gui colors
vim.o.termguicolors = true
vim.o.backspace = "indent,eol,start"

-- Add LSP keybindings

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Add scratch keybindings
vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")

-- [ Configure plugins ]

require('neodev').setup()


-- [Configure nvim-cmp]

local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	completion = {
		completeopt = 'menu,menuone,noinsert',
		keyword_length = 3
	},
	sources = cmp.config.sources {
		{ name = 'path' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	},
	mapping = cmp.mapping.preset.insert {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm(),
	},
}
-- [ Configure LSP ]

require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require('mason-lspconfig').setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require 'lspconfig'
lspconfig.bashls.setup({ capatibilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.groovyls.setup({ capabilities = capabilities })
lspconfig.lemminx.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.biome.setup({ capabilities = capabilities })
lspconfig.pylsp.setup({
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pylint = {
					enabled = true
				}
			}
		}
	}
})

-- Add LspAttach keybindings
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		-- Buffer local mappings
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end
})

-- [ Configure Indent Blankline ]
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"rainbowCyan"
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup({
	indent = { highlight = highlight, char = "│" },
	exclude = {
		filetypes = { 'dashboard', }
	}
})

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

