return
{
	-- Plugin
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	},

	-- Configuration
	config = function()
		require('telescope').setup()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Search local dir'})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'List open buffers'})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Help Tags'})
		vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {desc = 'Recent Files'})
	end
}