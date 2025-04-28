return
{
	-- Plugin
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	
	-- Dependencies
	dependencies = {
		'HiPhish/rainbow-delimiters.nvim',
		'romgrk/nvim-treesitter-context',
	},

	-- Configuration
	config = function()
		local install = require("nvim-treesitter.install")
		install.prefer_git = false

		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
			sync_install = false,
			highlight = {
				enable = true
			},
			indent = {
				enable = false
			},
		})
		
	end
}
