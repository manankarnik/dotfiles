-- Catppuccin Colorscheme.
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = true,
		},
	},
}
