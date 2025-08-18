return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"zapling/mason-conform.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"isort",
					"black",
					"pyright",
					"bash-language-server",
					"shfmt",
					"shellharden",
					"gopls",
					"gofumpt",
					"yaml-language-server",
					"yamlfix",
					"lua-language-server",
					"stylua",
					"taplo",
					"typescript-language-server",
					"quick-lint-js",
					"markdownlint",
					"prettier",
					"prettierd",
				},
				start_delay = 5000,
			})
		end,
	},
}
