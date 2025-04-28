-- Be sure to load this file before everything else!

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line'
vim.opt.cursorline = true

-- Identation config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Line number config
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.signcolumn = "number"

-- Hide search results highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
