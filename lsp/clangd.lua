return {
	cmd = {
		-- see clangd --help-hidden
		'clangd',
		-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
		-- to add more checks, create .clang-tidy file in the root directory
		-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
		"--clang-tidy",
		"--completion-style=bundled",
		"--header-insertion=iwyu",
	},
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
