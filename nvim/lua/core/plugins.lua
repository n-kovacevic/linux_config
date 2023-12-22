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
        'folke/neodev.nvim',
        opts = {}
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
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

    {
        'nvim-treesitter/nvim-treesitter',
    },

    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "LintaoAmons/scratch.nvim",
        event = "VeryLazy",
    },

    {
        "terrortylor/nvim-comment",
    },

    {
        'windwp/nvim-autopairs',
        opts = {}
    }
}, {})
