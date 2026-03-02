return
{
	-- Plugin
	'Civitasv/cmake-tools.nvim',

	-- Options
	opts = {
		cmake_dap_configuration = {
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			stopOnEntry = false,
			runInTerminal = false,
			console = "internalConsole",
		},
	}
}
