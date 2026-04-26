vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("hl-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--  This function gets called when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

        -- stylua: ignore start
        local tlb = require("telescope.builtin")
		map("grn",   vim.lsp.buf.rename,                "Re[n]ame")
		map("gra",   vim.lsp.buf.code_action,           "Code [A]ction", { "n", "x" })
		map("grr",   tlb.lsp_references,                "[R]eferences")
		map("gri",   tlb.lsp_implementations,           "[I]mplementation")
		map("grt",   tlb.lsp_type_definitions,          "[T]ype Definition")
		map("gO",    tlb.lsp_document_symbols,          "Document Symbols")
		map("grD",   vim.lsp.buf.declaration,           "[D]eclaration")
		map("grd",   tlb.lsp_definitions,               "[D]efinition")
		map("gW",    tlb.lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")
		map("<C-k>", vim.diagnostic.open_float,         "Open Floating Diagnostics")
		-- stylua: ignore end

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("grh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay [H]ints")
		end

		if
			client
			and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
