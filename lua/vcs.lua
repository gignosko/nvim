paq 'airblade/vim-gitgutter'
paq 'tpope/vim-fugitive'

keymap.nnoremap { "<LEADER>gg", ":Git <CR>", silent = true }
keymap.nnoremap { "<LEADER>gb", ":Git blame<CR>", silent = true }
keymap.nnoremap { "<LEADER>gh", ":Git difftool<CR>", silent = true }
keymap.nnoremap { "<LEADER>gm", ":Git mergetool<CR>", silent = true }

