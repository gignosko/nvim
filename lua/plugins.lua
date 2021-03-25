vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- Add your packages

paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'
paq 'nvim-lua/lsp_extensions.nvim'
paq{'dracula/vim', as='dracula'}   -- Use `as` to alias a package name (here `vim`)



paq 'tpope/vim-rails'
paq 'AndrewRadev/splitjoin.vim'
paq 'tpope/vim-endwise'
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'
paq 'mxw/vim-jsx'
paq 'airblade/vim-rooter'
paq 'posva/vim-vue'
paq 'tpope/vim-surround'
paq 'ap/vim-css-color'
paq 'tpope/vim-repeat'
-- paq 'elixir-lang/vim-elixir'
paq 'haishanh/night-owl.vim'
paq 'tjammer/blayu.vim'
paq 'scrooloose/nerdcommenter'
paq 'tpope/vim-vinegar'
paq 'mhinz/vim-startify'
paq 'mtth/scratch.vim'
paq 'Yggdroot/indentLine'
paq 'jiangmiao/auto-pairs'
paq 'whatyouhide/vim-gotham'
paq 'pangloss/vim-javascript'
paq 'MaxMEllon/vim-jsx-pretty'
paq 'majutsushi/tagbar'
paq 'nvim-lua/completion-nvim'
paq 'alvan/vim-closetag'
paq "nvim-lua/plenary.nvim"
paq "nvim-lua/popup.nvim"
paq 'nvim-telescope/telescope.nvim'
paq "junegunn/fzf"
paq "junegunn/fzf.vim"
paq "tjdevries/astronauta.nvim"
