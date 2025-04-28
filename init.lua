require("config.1_options")
require("config.lazy")

vim.lsp.enable({
	'clangd',
	'cmake',
	'lua_ls',
	'pylsp',
})
