return
{
	-- Plugin
	'Mofiqul/dracula.nvim',
	lazy = false,
	priority = 0xFFFF,

	-- Configuration
	config = function()
		vim.o.termguicolors = true
		vim.cmd.colorscheme 'dracula'
	end
}
