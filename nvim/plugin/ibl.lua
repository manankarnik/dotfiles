vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

require("ibl").setup({
	indent = { char = "┊" },
	scope = {
		char = "▎",
		show_start = false,
	},
})
