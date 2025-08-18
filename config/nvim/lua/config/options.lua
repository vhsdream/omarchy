-- Visual stuff
vim.opt.winborder = "rounded"

-- Set cmdline height to 1 line
vim.opt.cmdheight = 1

-- Set spaces intead of tabs, default 2 space indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers and sign column, show cursorline
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Case during search, override ignorecase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable cmdline completion mode
vim.opt.wildmenu = true

-- Enable system clipboard integration
vim.opt.clipboard:append("unnamedplus")

-- Set title string
vim.opt.title = true
vim.opt.titlestring = [[%{fnamemodify(getcwd(),':t')} - %{expand('%:.')}]]

-- Disable completion auto-select
-- vim.opt.completeopt:append("noselect")

-- Change the terminal's cursor, stop from blinking
vim.opt.guicursor = ""
vim.opt.guicursor = {
	"n-v-c:block", -- Block in normal mode
	"i:ver25", -- Vertical line in insert mode
}

-- Reduce delay when escaping?
vim.opt.updatetime = 300

-- Set conceallevel for Markdown
vim.opt.conceallevel = 2

-- Turn off hlsearch
vim.opt.hlsearch = false

-- Enable mouse support
vim.opt.mouse = "a"

-- Keep some space between cursor and bottom/top while scrolling
vim.opt.scrolloff = 10

-- Window split options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})
vim.g.clipboard = "osc52"
