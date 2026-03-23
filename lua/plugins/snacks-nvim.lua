return
{
	-- Plugin
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,

	-- Configuration
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
	}
}
