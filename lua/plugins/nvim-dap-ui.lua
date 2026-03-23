return
{
	-- Plugin
	"rcarriga/nvim-dap-ui",

	-- Run Setup() as soon as the plugin loads
	config = true,

	-- Dependencies
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio"
	}
}
