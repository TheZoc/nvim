return
{
	-- Plugin
	'williamboman/mason.nvim',

	-- Configuration
	config = function()
		require('mason').setup()
	end
}
