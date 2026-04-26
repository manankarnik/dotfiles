-- Show your pending keybinds.
return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		spec = {
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>l", group = "[L]SP" },
		},
	},
}
