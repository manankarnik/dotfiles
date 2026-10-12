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
	lua_ls = {
		on_init = function(client)
			local root = client.workspace_folders and client.workspace_folders[1].name
			if
				root
				and root ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(root .. "/.luarc.json") or vim.uv.fs_stat(root .. "/.luarc.jsonc"))
			then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = { version = "LuaJIT", path = { "lua/?.lua", "lua/?/init.lua" } },
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
					},
				},
			})
		end,
	},
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
	if name == "lua_ls" then
		print(server)
	end
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
