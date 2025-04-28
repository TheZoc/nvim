return
{
	-- Plugin
	'akinsho/bufferline.nvim',
	version = "*",
	
	-- Dependencies
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},

	-- Configuration
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "slant",
			}
		})	
	end

}

