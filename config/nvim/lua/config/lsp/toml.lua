vim.lsp.config.toml = {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	single_file_support = true,
}
vim.lsp.enable("toml")
