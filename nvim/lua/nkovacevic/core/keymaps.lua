vim.g.mapleader = " "

local keymap = vim.keymap

-- Disable delete moving data to register
keymap.set("n", "x", "\"_x")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Open file_browser" })
keymap.set("n", "<leader>ft", "<cmd>Telescope filetypes theme=dropdown<cr>", { desc = "Open file type browser" })
keymap.set("n", "<leader>tt", "<cmd>Telescope file_browser<cr>", { desc = "Open file_browser" })

-- LSP
keymap.set("n", "<leader>ref", "<cmd>Telescope lsp_references theme=ivy<cr>", { desc = "Show definition, references" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show definition, references" })
keymap.set("n", "<leader>re", vim.lsp.buf.rename, { desc = "Smart rename" })
keymap.set("n", "<leader>q", vim.lsp.buf.hover, { desc = "Show documentation" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic in floating window" })
keymap.set("n", "<leader>F", "<cmd>Format<cr>", { desc = "Format file" })


-- Additional keybindings
-- keymap.set("n", "<C-/>", "<cmd>Commentary<cr>", { desc = "Toggle comment on line(s)" })
