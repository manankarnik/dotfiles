vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
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

		local tlb = require("telescope.builtin")
		map("grn", vim.lsp.buf.rename, "Re[n]ame")
		map("gra", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })
		map("grr", tlb.lsp_references, "[R]eferences")
		map("gri", tlb.lsp_implementations, "[I]mplementation")
		map("grt", tlb.lsp_type_definitions, "[T]ype Definition")
		map("gO", tlb.lsp_document_symbols, "Document Symbols")
		map("grD", vim.lsp.buf.declaration, "[D]eclaration")
		map("grd", tlb.lsp_definitions, "[D]efinition")
		map("gW", tlb.lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")
		map("<C-k>", vim.diagnostic.open_float, "Open Floating Diagnostics")

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("grh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay [H]ints")
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
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

local function run_build(name, cmd, cwd)
	local result = vim.system(cmd, { cwd = cwd }):wait()
	if result.code ~= 0 then
		local stderr = result.stderr or ""
		local stdout = result.stdout or ""
		local output = stderr ~= "" and stderr or stdout
		if output == "" then
			output = "No output from build command."
		end
		vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
			run_build(name, { "make" }, ev.data.path)
			return
		end

		if name == "nvim-treesitter" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
			return
		end
	end,
})
