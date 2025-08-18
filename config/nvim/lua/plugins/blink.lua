return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = {},
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						align_to = "label",
						treesitter = { "lsp" },
					},
				},
				documentation = {
					window = { border = "rounded" },
					auto_show = true,
					treesitter_highlighting = true,
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
