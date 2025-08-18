vim.lsp.config.quickjs = {
	cmd = { "quick-lint-js", "--lsp-server" },
	filetypes = {
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
	},
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json" },
	single_file_support = true,
}
vim.lsp.enable("quickjs")
