vim.lsp.config.yaml = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml", "yaml.gitlab" },
  single_file_support = true,
  settings = {
    yaml = {
      redhat = { telemtry = { enabled = false } },
    },
  },
}

vim.lsp.enable("yaml")
