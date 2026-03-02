return
{
	-- Plugin
	'catgoose/nvim-colorizer.lua',
	event = "BufReadPre",

	-- Options
	opts = {},

	-- Configuration
	config = function()
		require('colorizer').setup()
	end
}