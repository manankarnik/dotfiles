-- Configure LSP support for enhanced coding features like navigation and code actions.
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"nvim-java/nvim-java",
			config = function()
				vim.lsp.config("jdtls", {
					settings = {
						java = {
							configuration = {
								runtimes = {
									{
										name = "JavaSE-11",
										path = "/usr/lib/jvm/java-11-openjdk",
										default = true,
									},
								},
							},
						},
					},
				})
			end,
		},
		{ "williamboman/mason.nvim", config = true },
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						winblend = 0,
					},
				},
			},
		},
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local servers = {
			lua_ls = {},
			stylua = {},
			-- clangd = {},
			rust_analyzer = {},
			gopls = {},
			pyright = {},
			isort = {},
			black = {},
			svelte = {},
			tailwindcss = {},
		}
		require("mason-tool-installer").setup({
			ensure_installed = vim.tbl_keys(servers or {}),
		})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
