return
{
	-- Plugin
	'stevearc/oil.nvim',
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,

	-- Dependencies
	dependencies = { "echasnovski/mini.icons" },

	-- Opts
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},

	-- Configuration
	config = function()
		require("oil").setup()

		vim.keymap.set('n', '<leader>fd', "<CMD>Oil<CR>", {desc = "Open Directory"})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end
}
