return
{
	-- mason-lspconfig bridges mason.nvim and nvim-lspconfig, so it's easier to install them together
	-- Plugin
	"mason-org/mason-lspconfig.nvim",

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},

	opts = {
		ensure_installed = {
			'clangd',
			'cmake',
			'lua_ls',
			'pylsp',
		}
	},
}
