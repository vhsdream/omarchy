return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateRight",
		"TmuxNavigateUp",
		"TmuxNavigateDown",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		vim.keymap.set({ "n", "t" }, "<C-h>", ":TmuxNavigateLeft<CR>"),
		vim.keymap.set({ "n", "t" }, "<C-j>", ":TmuxNavigateDown<CR>"),
		vim.keymap.set({ "n", "t" }, "<C-k>", ":TmuxNavigateUp<CR>"),
		vim.keymap.set({ "n", "t" }, "<C-l>", ":TmuxNavigateRight<CR>"),
		vim.keymap.set({ "n", "t" }, "<C-\\>", ":TmuxNavigatePrevious<CR>"),
	},
}
