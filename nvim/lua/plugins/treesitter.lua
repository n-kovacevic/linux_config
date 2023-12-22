require('nvim-treesitter.configs').setup({
    modules = {},
    highlight = { enable = true },

    indent = { enable = true },
    auto_install = true,
    ensure_installed = {'lua', 'vim', 'vimdoc', 'json', 'sql', 'xml', 'bash'},
    sync_install = false,
    ignore_install = {}
})
