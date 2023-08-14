-- Configure map leader
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '

vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoread = true

-- Identation config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Hide search results highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
