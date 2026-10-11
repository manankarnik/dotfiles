vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
	delay = 0,
	spec = {
		{ "<leader>f", group = "[F]ind" },
		{ "<leader>l", group = "[L]SP" },
	},
})
