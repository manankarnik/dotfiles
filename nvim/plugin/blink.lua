vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		menu = { auto_show = true },
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
	},
	signature = { enabled = true },
})
