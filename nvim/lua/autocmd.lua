vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("hl-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

        -- stylua: ignore start
		map("grd", require("telescope.builtin").lsp_definitions,               "[G]oto [D]efinition")
		map("grr", require("telescope.builtin").lsp_references,                "[G]oto [R]eferences")
		map("gri", require("telescope.builtin").lsp_implementations,           "[G]oto [I]mplementation")
		map("gri", require("telescope.builtin").lsp_type_definitions,          "Type [D]efinition")
		map("g0",  require("telescope.builtin").lsp_document_symbols,          "[D]ocument [S]ymbols")
		map("gW",  require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		map("gD",    vim.lsp.buf.declaration,   "[G]oto [D]eclaration")
		map("<C-k>", vim.diagnostic.open_float, "Open Floating Diagnostic")
		-- stylua: ignore end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle [I]nlay [H]ints")
		end
	end,
})
