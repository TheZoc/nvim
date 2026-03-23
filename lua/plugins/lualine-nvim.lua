return
{
	-- Plugin
	'nvim-lualine/lualine.nvim',

	-- Dependencies
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},

	-- Configuration
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'dracula-nvim',
			},
			sections = {
				lualine_c = {
					{
						'filename',
						path = 1,
					}
				}
			}
		}
	end
}
