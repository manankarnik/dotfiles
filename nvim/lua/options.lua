local options = {
    -- stylua: ignore start
	ignorecase     = true,
	smartcase      = true,
	splitbelow     = true,
	splitright     = true,
	title          = true,
	number         = true,
	relativenumber = true,
	cursorline     = true,
	breakindent    = true,
	undofile       = true,
	expandtab      = true,
	confirm        = true,
	swapfile       = false,
	backup         = false,

	scrolloff      = 2,
	laststatus     = 3,
	tabstop        = 4,
	shiftwidth     = 4,
	updatetime     = 250,

	guicursor      = "",
	signcolumn     = "no",
	inccommand     = "split",
	cursorlineopt  = "number",
	statuscolumn   = "%s%=%{!&number && !&relativenumber ? '' : v:virtnum != 0 ? '' : v:relnum == 0 ? v:lnum : v:relnum} ",
	-- stylua: ignore end
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
