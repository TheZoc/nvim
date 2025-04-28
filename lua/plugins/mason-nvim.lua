return
{
	-- mason-lspconfig bridges mason.nvim and nvim-lspconfig, so it's easier to install them together
	-- Plugin
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	-- Opts - Make sure these are included in vim.lsp.enable()
	opts = {
		ensure_installed = {
			'clangd',
			'cmake',
			'lua_ls',
			'pylsp',
		}
	},

	-- Configuration
	config = function(opts)
		require('mason').setup()
		require('mason-lspconfig').setup(opts)
	end
}
