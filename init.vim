lua vim.g.mapleader = ' '
"---------------------------------------------------------
" => My Stuff
"---------------------------------------------------------
:nnoremap <silent> <leader>ch :nohlsearch<Bar>:echo<CR>

" vnoremap < <gv 
" vnoremap > >gv

let g:NERDSpaceDelims = 1
" Shows marker for spaces at indent
let g:indentLine_leadingSpaceEnabled = 1
" In insert mode, C-v then u250B
let g:indentLine_char = "┋"

au FileType python map <silent>pb oimport pudb; pudb.set_trace()<esc>
au FileType ruby map <silent>pb obinding.pry<esc>
au FileType elixir map <silent>pb orequire IEx; IEx.pry<esc>
au FileType javascript map <silent>pb odebugger;<esc>

" let g:rainbow_active = 1
" :nnoremap <leader>bl :buffers<CR>:buffer<Space>
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'


:nnoremap <leader>o :Buffers<CR>

let g:NERDCreateDefaultMappings = 0
map <leader>cc <plug>NERDCommenterToggle
nmap <leader>tb :TagbarToggle<cr><C-W><C-L>
nmap <leader>tc <C-W> :TagbarClose<cr>

" Show the filename in the window titlebar
set title

" Always show status line
set laststatus=2
" Show the filename in the window titlebar
set title

" Enable mouse in all modes
set mouse=a

" Toggle between two buffers
" tnoremap <Esc> <C-\><C-n>
" tnoremap <M-[> <Esc>
" tnoremap <C-v><Esc> <Esc>
" tnoremap <leader><Tab> <C-\><C-n> :call ToggleBuffer()<CR>
" tnoremap <leader>o <C-\><C-n> :Buffers<CR>
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" Need this so vim's use of Ag will respect .gitignore
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" fzf and rg Find command
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-file "~/.gitignore_global" --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Uses the find() method defined below for uzing fzf and rg)
" nnoremap <leader>ff :Find <C-R><C-W><CR>
" nnoremap <leader>Ff :Files <CR>
" nnoremap <C-p> :Files <CR>


" Don’t reset cursor to start of line when moving around.
" set nostartofline

" nnoremap <leader>sc :Scratch <cr>
"---------------------------------------------------------
" => Colors and Fonts
"---------------------------------------------------------
" Enable syntax highlighting
syntax enable
syntax on

set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"---------------------------------------------------------
" => Files, backups and undo
"---------------------------------------------------------
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"---------------------------------------------------------
" => Text, tab and indent related
"---------------------------------------------------------
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"---------------------------------------------------------
" => Visual mode related
"---------------------------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" " Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"---------------------------------------------------------
" => Misc
"---------------------------------------------------------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"---------------------------------------------------------
" => Helper functions
"---------------------------------------------------------
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"---------------------------------------------------------
" Plugins
"---------------------------------------------------------
" Install Vim-plugged if not installed
" if empty(glob('~/.vim/autoload/plug.vim'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.config/nvim/plugged')

" Plug 'tpope/vim-rails'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'tpope/vim-endwise'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'airblade/vim-gitgutter'
" Plug 'mxw/vim-jsx'
" " Plg '/usr/local/bin/fzf'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'
" Plug 'bpolly/vim-ttr'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'markonm/traces.vim'
" Plug 'posva/vim-vue'
" Plug 'tpope/vim-surround'
" Plug 'ap/vim-css-color'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/vim-easy-align'
" Plug 'elixir-lang/vim-elixir'
" Plug 'jesseleite/vim-agriculture'
" Plug 'kchmck/vim-coffee-script'

" " Colorschemes
" Plug 'haishanh/night-owl.vim'
" Plug 'tjammer/blayu.vim'

" " My additions
" " Initialize plugin system
" " Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-vinegar'
" Plug 'mhinz/vim-startify'
" Plug 'mtth/scratch.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'jremmen/vim-ripgrep'
" Plug 'jiangmiao/auto-pairs'
" Plug 'whatyouhide/vim-gotham'
" Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'majutsushi/tagbar'
" " Plug 'neovim/nvim-lsp'
" " Plug 'weilbith/nvim-lsp-smag'
" " Plug 'haorenW1025/completion-nvim'
" " Plug 'haorenW1025/diagnostic-nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'alvan/vim-closetag'
call plug#end()
set number
" Don't add a comment if opening a new line under a commented line
set formatoptions-=ro
let g:closetag_filenames = '*.html,*.xhtml,*.vue, *.eex'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue'

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.vue setfiletype html

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/tmp,*/node_modules

"---------------------------------------------------------
" RENAME CURRENT FILE
"---------------------------------------------------------
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>rn :call RenameFile()<cr>

set colorcolumn=100
highlight ColorColumn ctermbg=DarkGrey
"---------------------------------------------------------
" CUSTOM COLORS
"---------------------------------------------------------
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme night-owl
set background=dark
set termguicolors

" Green Visual Mode Highlight
highlight Visual guibg=#00ffaf ctermbg=49 guifg=#2d2c5d ctermfg=236 gui=NONE cterm=NONE

" Disable BCE to prevent color weirdness on tmate
set t_ut=

"---------------------------------------------------------
" Custom Key Mappings
"---------------------------------------------------------
noremap <Leader>t :tabnew<CR>
noremap <Leader>ws :StripWhitespace<CR>
nmap \ :AgRaw -Q<Space>
vmap \ <Plug>AgRawVisualSelection <Enter>
runtime macros/matchit.vim

"----------------------------------------------------------
" ag/FZF Settings
"----------------------------------------------------------
noremap <C-p> :Files<CR>
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'

"----------------------------------------------------------
" vim-fugitive Settings
"----------------------------------------------------------
map <Leader>gs :Gstatus<Enter>
map <Leader>gl :Glog<Enter>:copen<Enter>

"----------------------------------------------------------
" GitGutter Settings
"----------------------------------------------------------
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_modified_removed = '┃'
set updatetime=100

"----------------------------------------------------------
" Multiple Cursors
"----------------------------------------------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

set clipboard=unnamed

set foldmethod=manual
set foldlevel=20

" set matchit. Works on ruby do/end
runtime macros/matchit.vim
" Fold selected lines in visual mode
xmap f zf

" Delete all folds in normal mode
nmap <Leader>cf zE

"----------------------------------------------------------
" VimAirline - Vim Status Bar
"----------------------------------------------------------
let g:airline_highlighting_cache = 1
" remove the filetype part
" let g:airline_section_b=''
let g:airline_section_x=''
let g:airline_section_y=''
" remove separators for empty sections
let g:airline_skip_empty_sections = 1
let g:airline_section_z = "%3p%% %l:%c"
let g:airline_theme='dark'

"----------------------------------------------------------
" Rooter - Keep FZF current with project root
"----------------------------------------------------------
 " autocmd BufEnter * :Rooter

" set showtabline=1

"-------------------------------
" begin lua configs
"-------------------------------


"Sets completion 
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
" lua
lua require('languageservers')
lua require('settings')
lua require('plugins')
lua require('search')

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fB <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>e <cmd>lua require('telescope.builtin').file_browser()<cr>
nmap <leader>e :Explore<CR>
nnoremap <leader>st :Startify <cr>
function! ToggleBuffer()
      b#
  endfunction

nmap <leader><Tab> :call ToggleBuffer()<CR>
nnoremap <leader>sc :Scratch <cr>

" stuff I'm unsure about
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
