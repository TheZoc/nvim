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

		vim.keymap.set('n', '<c-p>', builtin.find_files, {})
		vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
}