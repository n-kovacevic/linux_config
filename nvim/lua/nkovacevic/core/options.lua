vim.cmd('let g:netrw_liststyle = 3')
local opt = vim.opt

-- turn on line numbers
opt.relativenumber = true
opt.number = true


-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true


-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- display settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.breakindent = true

-- general settings
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backspace = "indent,eol,start"
opt.mouse = ""

-- highlight colors 
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })

