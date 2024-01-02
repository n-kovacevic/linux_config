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
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "lemminx",
        "bashls"
    }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require 'lspconfig'
lspconfig.ansiblels.setup({ capabilities = capabilities })
lspconfig.bashls.setup({ capatibilities = capabilities })
-- lspconfig.biome.setup({ capabilities = capabilities })
lspconfig.docker_compose_language_service.setup({ capatibilities = capabilities })
lspconfig.dockerls.setup({ capatibilities = capabilities })
-- lspconfig.helm_ls.setup({ capatibilities = capabilities })
-- lspconfig.html.setup({ capatibilities = capabilities })
-- lspconfig.jdtls.setup({ capabilities = capabilities })
lspconfig.java_language_server.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capatibilities = capabilities })
lspconfig.lemminx.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
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
