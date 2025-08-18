return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.starter").setup()
		require("mini.comment").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.cursorword").setup()
		require("mini.bracketed").setup({
			undo = { suffix = "" },
		})
		require("mini.jump").setup({
			delay = {
				highlight = 750,
				idle_stop = 8000,
			},
		})
		require("mini.animate").setup({
			-- scroll = {
			-- 	enable = false,
			-- },
		})
		require("mini.pairs").setup({
			mappings = {
				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%a\\].", register = { cr = false } },
			},
		})
	end,
}
