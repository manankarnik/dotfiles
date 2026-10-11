vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		c = { "clang-format" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		tex = { "latexindent" },
		bib = { "latexindent" },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		vue = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
	},
})
