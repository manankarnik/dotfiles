-- Configure LSP support for enhanced coding features like navigation and code actions.
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				lua_ls = {},
				stylua = {},
				clangd = {},
				rust_analyzer = {},
				gopls = {},
				pyright = {},
				jdtls = {},
				svelte = {},
				tailwindcss = {},
			},
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
