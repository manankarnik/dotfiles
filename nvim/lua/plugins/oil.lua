return {
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
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
    lazy = false,
}
