" -------------------
" Basic configuration
" -------------------
syntax on
set autoread
set encoding=UTF-8
set number                      " Show line numbers
set showmatch                   " Highlight matching brace
set hlsearch                    " Highlight all search results
set incsearch                   " Searches for strings incrementally
set autoindent                  " Auto-indent new lines
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2                " Number of auto-indent spaces
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set softtabstop=2               " Number of spaces per Tab
set nofoldenable                " Disable folding on start

if exists('+termguicolors')
  set termguicolors
endif

" -------
" Plugins
" -------

" Install plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin(data_dir . '/plugged')

Plug 'preservim/nerdtree'
let g:NERDTreeShowHidden = 1

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'yggdroot/indentline'

Plug 'tpope/vim-commentary'

Plug 'phaazon/hop.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git-related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language-related plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Once nvim-treesitter is installed, enable individual parsers
" manually through :TSInstall {language}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

" NOTE: Make sure to install a patched font:
" https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" colorscheme dracula
" colorscheme onehalfdark
colorscheme nord

" enable lua config
lua require('config')
