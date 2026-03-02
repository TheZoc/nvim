return
{
	-- Plugin
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	branch = 'main',
	build = ":TSUpdate",
	
	-- Dependencies
	dependencies = {
		'HiPhish/rainbow-delimiters.nvim',
		-- 'romgrk/nvim-treesitter-context',
	},

	-- Configuration
	config = function()
		-- Installation snippet from: https://www.reddit.com/r/neovim/comments/1kuj9xm/comment/mu6acjr/
		local ensureInstalled = { "c", "cpp", "lua", "markdown", "markdown_inline", "regex", "vim", "vimdoc" }
		local alreadyInstalled = require("nvim-treesitter").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end
}
