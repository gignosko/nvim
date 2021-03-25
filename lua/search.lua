vim.o.ignorecase = true
vim.o.smartcase = true


local keymap = require("astronauta.keymap")

keymap.nnoremap { "<LEADER><LEADER>", ":Maps<CR>", silent = true }
keymap.nnoremap { "<LEADER>ff", ":Files<CR>", silent = true }
keymap.nnoremap { "<LEADER>fg", ":Rg " }
keymap.nnoremap { "<LEADER>fw", ":Rg <C-R><C-W><CR>", silent = true }
keymap.nnoremap { "<LEADER>", ":Buffers<CR>", silent = true }

keymap.nnoremap { "<BSLASH><BSLASH>", ":nohlsearch<CR>", silent = true }


