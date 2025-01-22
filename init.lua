-- numberline
vim.opt.nu = true
vim.opt.relativenumber = true
--tabspacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
--other settings
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.enable_default_keybindings = true

-- plugin manager 
require("config.lazy")
