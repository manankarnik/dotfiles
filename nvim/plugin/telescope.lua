vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
})

require("telescope").setup({
	defaults = { mappings = { i = { ["<ESC>"] = require("telescope.actions").close } } },
	pickers = {
		find_files = { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } },
		grep_string = { additional_args = { "--hidden", "-g", "!.git" } },
		live_grep = { additional_args = { "--hidden", "-g", "!.git" } },
	},
	extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
})

pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })

vim.keymap.set("n", "<leader>f/", function()
	builtin.live_grep({ grep_open_files = true })
end, { desc = "[F]ind [/] in Open Files" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>f.", function()
	builtin.find_files({ cwd = "~/dotfiles" })
end, { desc = "[F]ind [.] Dotfiles" })
