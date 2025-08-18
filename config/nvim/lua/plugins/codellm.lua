return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "ollama",
				slash_commands = {
					["file"] = {
						opts = {
							provider = "snacks",
						},
					},
					["buffer"] = {
						opts = {
							provider = "snacks",
						},
					},
				},
			},
			cmd = {
				adapter = "ollama",
			},
			inline = {
				adapter = "ollama",
				keymaps = {
					accept_change = {
						modes = { n = "<leader>ca" },
						description = "Accept the change",
					},
					reject_change = {
						modes = { n = "<leader>cr" },
						description = "Reject the change",
					},
				},
			},
		},
		adapters = {
			opts = {
				show_defaults = true,
			},
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					env = {
						url = "http://ollama.cnose.xyz:11434",
					},
					parameters = {
						sync = true,
					},
					schema = {
						model = {
							default = "deepcoder:1.5b-preview-fp16",
						},
					},
				})
			end,
		},
		display = {
			action_palette = {
				prompt = "Prompt ",
				provider = "default",
				opts = {
					show_default_actions = true,
					show_default_prompt_library = true,
				},
			},
			chat = {
				window = {
					layout = "vertical",
					position = "top",
					width = 0.4,
					opts = {
						list = true,
					},
				},
			},
			inline = {
				layout = "horizontal",
			},
		},
	},
	vim.keymap.set({ "n", "v" }, "<M-a>", "<cmd>CodeCompanionActions<CR>", { noremap = true, silent = true }),
	vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", { noremap = true, silent = true }),
	vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<CR>", { noremap = true, silent = true }),
}
