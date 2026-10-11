vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({})
require("mason-lspconfig").setup({})

local servers = {
	stylua = {},
	lua_ls = {},
	clangd = {},
	rust_analyzer = {},
	gopls = {},
	pyright = {},
	isort = {},
	black = {},
	svelte = {},
	tailwindcss = {},
}

require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers) })

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
