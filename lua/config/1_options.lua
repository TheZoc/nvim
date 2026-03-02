-- Be sure to load this file before everything else!

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable Nerd Font for Maple Mono NF CN
vim.g.have_nerd_font = true

vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line'
vim.opt.cursorline = true

-- Monimum amount of lines to leave before and after the cursor
vim.opt.scrolloff = 7

-- Enable mouse
vim.opt.mouse = 'a'

-- Enable OS clipboard
vim.opt.clipboard = 'unnamedplus'

-- Don't show the mode as we configure lualine.nvim to display it
vim.opt.showmode = false

-- Identation config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Line number config
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.signcolumn = "number"

-- Ignore search case
vim.opt.ignorecase = true

-- Make the search Case Sensitive if the searched term include capital letters
vim.opt.smartcase = true

-- Always display the signcolumn, for debugging purposes
vim.opt.signcolumn = 'yes'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '▫', nbsp = '␣', multispace = '·' }

-- When using :%s/a/b/ substitutions, display the matching and replacement while being typed
vim.opt.inccommand = 'split'

-- Hide search results highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float,  { desc = 'Open floating diagnostic message' })

-- lsp
vim.keymap.set('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- Highlighed yanked word/line/block
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout=300 })
	end,
})

vim.diagnostic.config {
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
}
