local opts = { noremap = true, silent = true }

-- stylua: ignore start
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

vim.keymap.set("",  "<Space>",   "<Nop>",   opts)
vim.keymap.set("x", "<leader>p", '"_dP',    opts)
vim.keymap.set("x", "<leader>y", '"+y',     opts)
vim.keymap.set("n", "<leader>Y", '"+Y',     opts)
vim.keymap.set("n", "<c-u>",     "<c-u>zz", opts)
vim.keymap.set("n", "<C-d>",     "<C-d>zz", opts)
vim.keymap.set("n", "n",         "nzzzv",   opts)
vim.keymap.set("n", "N",         "Nzzzv",   opts)
-- stylua: ignore end
