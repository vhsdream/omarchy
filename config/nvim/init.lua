vim.loader.enable()
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
require("config.lazy")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})

-- Load all LSPs in "lua/config/lsp"
local lsp_path = vim.fn.stdpath("config") .. "/lua/config/lsp"

require("config.lsp.global")
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") and file ~= "global.lua" then
    local module_name = "config.lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
