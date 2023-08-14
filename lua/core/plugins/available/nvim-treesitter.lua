return
{
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	dependencies = {
		'HiPhish/nvim-ts-rainbow2',
		'romgrk/nvim-treesitter-context',
	}
}