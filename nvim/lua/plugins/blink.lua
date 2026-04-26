-- Set up blink.cmp for intelligent autocompletion and snippet management.
return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "VimEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
		"folke/lazydev.nvim",
	},
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
		},
		signature = { enabled = true },
	},
}
