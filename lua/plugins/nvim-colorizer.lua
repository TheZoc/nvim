return
{
	-- Plugin
	'norcalli/nvim-colorizer.lua',

	-- Configuration
	config = function()
		require('colorizer').setup()
	end
}