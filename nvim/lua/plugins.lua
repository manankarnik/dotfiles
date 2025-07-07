-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "vyfor/cord.nvim", build = ":Cord update" },
	{ "tpope/vim-fugitive", cmd = "G" },
	{
		"echasnovski/mini.statusline",
		opts = {},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree" })
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				tailwind = "both",
				names = false,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			highlight = { enable = true },
		},
	},
	{
		"ej-shafran/compile-mode.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.g.compile_mode = {}
			vim.keymap.set("n", "<C-p>", "<cmd>PrevError<CR>", {})
			vim.keymap.set("n", "<C-n>", "<cmd>NextError<CR>", {})
		end,
	},
	{
		"Saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			completion = {
				ghost_text = { enabled = true },
				menu = { auto_show = false },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[=] Format buffer",
			},
		},
		config = function()
			require("conform").setup({
				notify_on_error = false,
				format_on_save = function(bufnr)
					local ignore_filetypes = { "c" }
					if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
						return
					end
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end,
				formatters_by_ft = {
                    -- stylua: ignore start
                    lua        = { "stylua" },
                    python     = { "isort", "black" },
                    html       = { "prettier" },
                    css        = { "prettier" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    json       = { "prettier" },
                    svelte     = { "prettier" },
                    markdown   = { "prettier" },
					-- stylua: ignore end
				},
			})
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable format on save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Enable format on save",
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = {
					{ "icon", add_padding = false },
					"permissions",
					"size",
					"mtime",
				},
				keymaps = {
					["<C-c>"] = false,
					["<C-l>"] = false,
					["<C-;>"] = "actions.refresh",
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		end,
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<ESC>"] = require("telescope.actions").close },
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
					grep_string = {
						additional_args = { "--hidden", "-g", "!.git" },
					},
					live_grep = {
						additional_args = { "--hidden", "-g", "!.git" },
					},
				},
			})

			local builtin = require("telescope.builtin")
            -- stylua: ignore start
            vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "[F]ind [H]elp" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps,     { desc = "[F]ind [K]eymaps" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "[F]ind [F]iles" })
            vim.keymap.set("n", "<leader>ft", builtin.builtin,     { desc = "[F]ind [T]elescope" })
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "[F]ind by [G]rep" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
            vim.keymap.set("n", "<leader>fr", builtin.resume,      { desc = "[F]ind [R]esume" })
            vim.keymap.set("n", "<leader>f.", builtin.oldfiles,    { desc = "[F]ind Recent Files ([.] for repeat)" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "[F]ind [B]uffers" })
			-- stylua: ignore end

			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind [N]eovim files" })
		end,
	},
})
