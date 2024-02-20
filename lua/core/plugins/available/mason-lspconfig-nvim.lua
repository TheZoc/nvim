return
{
	-- Plugin
	'williamboman/mason-lspconfig.nvim',

	-- Dependencies
	dependencies = {
		'williamboman/mason.nvim',
	},

	-- Opts
	opts = {
		ensure_installed = {
			"clangd",
		}
	},

	-- Configuration
	config = function(self, opts)
		require('mason-lspconfig').setup(opts)
	end
}

