return
{
	-- Plugin
	'nvim-mini/mini.nvim',
	lazy = true,
	version = false,

	-- Options
	opts = {},

	-- From: https://www.reddit.com/r/neovim/comments/1duf3w7/comment/lbgbc6a/
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},

	-- Initialization
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,

	-- Configuration
	config = function()
		require('mini.icons').setup()
	end
}
