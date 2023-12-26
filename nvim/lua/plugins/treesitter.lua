require('nvim-treesitter.configs').setup({
    modules = {},
    highlight = { enable = true },

    indent = { enable = true },
    auto_install = false,
    ensure_installed = {'bash', 'vimdoc', 'vim'},
    sync_install = false,
    ignore_install = {}
})
