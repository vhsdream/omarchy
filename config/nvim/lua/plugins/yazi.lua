return {
	"mikavilpas/yazi.nvim",
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
	event = "VeryLazy",
	dependencies = { "folke/snacks.nvim", lazy = false },
	keys = {
		{
			"<leader>j",
			mode = { "n", "v" },
			":Yazi<cr>",
			desc = "Open Yazi at current file",
		},
		{
			"<leader>d",
			":Yazi cwd<cr>",
			desc = "Open Yazi in nvim working dir",
		},
		{
			"<c-up>",
			":Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		floating_window_scaling_factor = 0.75,
		open_for_directories = true,
		-- highlight_groups = {
		-- 	hovered_buffer = false,
		-- },
		highlight_hovered_buffer_in_same_directory = false,
		keymaps = {
			show_help = "<f1>",
			open_file_in_vertical_split = "<c-v>",
			open_file_in_horizontal_split = "<c-x>",
			open_file_in_tab = "<c-t>",
			grep_in_directory = "<c-s>",
			replace_in_directory = "<c-g>",
			cycle_open_buffers = "<tab>",
			copy_relative_path_to_selected_files = "<c-y>",
			send_to_quickfix_list = "<c-q>",
			change_working_directory = "<c-\\>",
		},
	},
}
