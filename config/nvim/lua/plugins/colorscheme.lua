return {
	{
		"rmehri01/onenord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- local colors = require("onenord.colors").load()
			require("onenord").setup({
				borders = true,
				fade_nc = true,
				disable = {
					background = false,
					float_background = false,
					cursorline = false,
				},
				custom_colors = {
					cyan = "#81A1C1",
					light = {
						blue = "#5E81AC",
						bg = "#E5E9F0",
						active = "#D8DEE9",
					},
				},
			})
		end,
	},
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false,
	-- 	priority = 1001,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			transparent = true,
	-- 			dim_inactive = true,
	-- 		})
	-- 	end,
	-- },
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 2000,
		},
	},
}
