local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'cursorline', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'wildmenu', true)
utils.opt('o', 'ruler', true)
utils.opt('o', 'cmdheight', 2)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'hlsearch', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'showmatch', true) -- find matching brackets
utils.opt('o', 'mat', 2) -- how long to blink when a matching bracket is found
utils.opt('o', 'errorbells', false)
utils.opt('o', 'visualbell', false)
utils.opt('o', 'tm', 500) -- timeout length, time to wait for a mapped sequence to complete
utils.opt('o', 'startofline', false) -- timeout length, time to wait for a mapped sequence to complete

cmd 'history = 500'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Probably move to it's own file
vim.g.mapleader = ' '

local keymap = require("astronauta.keymap")
keymap.vnoremap { "<", "<gv" }
keymap.vnoremap { ">", ">gv" }
