return
{
	-- Plugin
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},

	-- Configuration
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				adaptive_size = true
			}
		})

		vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
	end
}