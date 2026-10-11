vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.title = true
vim.o.showmode = false
vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.statuscolumn = "%s%=%{v:virtnum != 0 ? '' "
	.. ": &rnu ? (v:relnum ? v:relnum : (&nu ? v:lnum : 0)) "
	.. ": &nu ? v:lnum : ''} "

vim.o.breakindent = true
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.laststatus = 3
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,space:·"

vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.o.scrolloff = 2
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.confirm = true
