vim.diagnostic.config({
	severity_sort = true,
	float = { source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " 󰅙",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " 󰋼",
			[vim.diagnostic.severity.HINT] = " 󰌵",
		},
	},
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
})

vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.config("luals", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			hint = { enable = true },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
})

vim.lsp.enable("luals")
vim.lsp.enable("rust_analyzer")
