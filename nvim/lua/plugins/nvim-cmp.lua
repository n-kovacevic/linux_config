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
		['<Tab>'] = cmp.mapping.confirm(),
		['<Esc>'] = cmp.mapping.abort(),
	},
}
