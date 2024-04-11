return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                path_display = { "smart" }
            },
            extensions = {
                file_browser = {
                    theme = "ivy",
                    grouped = true,
                    hijack_netrw = true,
                    collapse_dirs = true,
                    prompt_path = true,
                    hide_parent_dir = true
                }
            }
        })

        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")

    end
}
