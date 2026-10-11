vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	columns = {
		{ "icon", add_padding = false },
		"permissions",
		"size",
		"mtime",
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open parent directory" })
