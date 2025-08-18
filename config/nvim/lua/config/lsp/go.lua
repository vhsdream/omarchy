vim.lsp.config.go = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gosum", "gowork", "gotmpl" },
  root_markers = {
    "go.mod",
    "go.sum",
  },
  single_file_support = true,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      staticcheck = true,
      gofumpt = true,
      semanticTokens = true,
    },
  },
}

vim.lsp.enable("go")
