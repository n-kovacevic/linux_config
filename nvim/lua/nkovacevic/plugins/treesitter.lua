return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function ()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = { enable = true },
             -- auto_install = false,
            ensure_installed = {
                "lua",
                "groovy",
                "bash",
                "json",
                "yaml",
                "html",
                "css",
                "markdown",
                "dockerfile",
                "gitignore",
                "vimdoc",
                "java",
                "gitcommit",
                "pem",
                "sql",
                "ssh_config",
                "terraform",
                "xml"
            }
        })
    end
}
