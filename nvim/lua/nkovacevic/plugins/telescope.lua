return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                path_display = { "smart" }
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true
                }
            }
        })

        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")

    end
}
