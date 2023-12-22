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

