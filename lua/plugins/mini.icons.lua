return
{
	-- Plugin
	'echasnovski/mini.icons',
	lazy = true,
	version = false,

	-- Options
	opts = {},

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
