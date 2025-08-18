return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		ui_select = true,
		opts = {
			zen = {
				toggles = {
					dim = true,
					git_signs = false,
					diagnostics = false,
					inlay_hints = false,
					indent = false,
				},
			},
			lazygit = {},
			terminal = {
				interactive = false,
				start_insert = true,
				auto_close = true,
			},
			indent = {
				indent = {
					char = "▎",
					only_scope = true,
					only_current = true,
				},
				animate = {
					enabled = false,
				},
				scope = {
					enabled = true,
					char = "▎",
					only_current = true,
					hl = "WildMenu",
				},
			},
			input = {
				backdrop = false,
				position = "float",
				border = "rounded",
				title_pos = "center",
				height = 1,
				width = 60,
				relative = "editor",
				noautocmd = true,
				row = 2,
				wo = {
					winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
					cursorline = false,
				},
				toggle = {},
				bo = {
					filetype = "snacks_input",
					buftype = "prompt",
				},
				--- buffer local variables
				b = {
					completion = false, -- disable blink completions in input
				},
			},
			picker = {
				debug = {
					scores = false, -- show scores in the list
				},
				layout = {
					preset = "ivy",
					cycle = false,
				},
				layouts = {
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0.5,
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},
					vertical = {
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 80,
							height = 0.8,
							min_height = 30,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
						},
					},
				},
			},
			matcher = {
				frecency = true,
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["J"] = { "preview_scroll_down", mode = { "i", "n" } },
						["K"] = { "preview_scroll_up", mode = { "i", "n" } },
						["H"] = { "preview_scroll_left", mode = { "i", "n" } },
						["L"] = { "preview_scroll_right", mode = { "i", "n" } },
					},
				},
			},
			formatters = {
				file = {
					filename_first = true,
					truncate = 80,
				},
			},
			styles = {
				blame_line = {
					width = 0.6,
					height = 0.6,
					border = "rounded",
					title = " Git Blame ",
					title_pos = "center",
					ft = "git",
				},
				snacks_image = {
					relative = "editor",
					col = -1,
				},
				terminal = {
					position = "float",
					border = "rounded",
					width = 0.85,
					height = 0.7,
					-- col = 0.6,
					-- row = 0,
				},
				lazygit = {
					border = "none",
					width = 0.85,
					height = 0.95,
				},
				zen = {
					minimal = true,
					backdrop = {
						transparent = true,
						blend = 20,
					},
				},
			},
			image = {
				enabled = true,
				doc = {
					inline = false,
					float = true,
					max_width = 60,
					max_height = 30,
				},
			},
		},
		keys = {
			{
				"<C-i>",
				function()
					if Snacks.indent.enabled == true then
						Snacks.indent.disable()
					else
						Snacks.indent.enable()
					end
				end,
				desc = "Toggle indent scope",
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit.open()
				end,
				desc = "Toggle Lazygit",
			},
			{
				"<M-C-t>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle terminal",
			},
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log({
						finder = "git_log",
						format = "git_log",
						preview = "git_show",
						confirm = "git_checkout",
						layout = "vertical",
					})
				end,
				desc = "Git Log",
			},
			{
				"<M-b>",
				function()
					Snacks.picker.git_branches({
						layout = "select",
					})
				end,
				desc = "Branches",
			},
			{
				"<M-k>",
				function()
					Snacks.picker.keymaps({
						layout = "vertical",
					})
				end,
				desc = "Keymaps",
			},
			{
				"<leader><leader>",
				function()
					Snacks.picker.files({
						finder = "files",
						format = "file",
						show_empty = true,
						supports_live = true,
					})
				end,
				desc = "Find Files",
			},
			{
				"<leader>b",
				function()
					Snacks.picker.buffers({
						on_show = function()
							vim.cmd.stopinsert()
						end,
						finder = "buffers",
						format = "buffer",
						hidden = false,
						unloaded = true,
						current = true,
						sort_lastused = true,
						win = {
							input = {
								keys = {
									["d"] = "bufdelete",
								},
							},
							list = { keys = { ["d"] = "bufdelete" } },
						},
					})
				end,
				desc = "[P]Snacks picker buffers",
			},
			{
				"<leader>z",
				function()
					Snacks.zen.zen()
				end,
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
			},
		},
	},
}
