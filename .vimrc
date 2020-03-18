" Basic configuration; c/o vimconfig.com
syntax on
set encoding=UTF-8
set number	                " Show line numbers
set showmatch	              " Highlight matching brace
set hlsearch	              " Highlight all search results
set incsearch	              " Searches for strings incrementally
set autoindent	            " Auto-indent new lines
set expandtab	              " Use spaces instead of tabs
set shiftwidth=2	          " Number of auto-indent spaces
set smartindent	            " Enable smart-indent
set smarttab	              " Enable smart-tabs
set softtabstop=2	          " Number of spaces per Tab

" Install plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1"

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'yggdroot/indentline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'terryma/vim-multiple-cursors'

" Git-related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language-related plugins

Plug 'elixir-editors/vim-elixir'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'plasticboy/vim-markdown'

" NOTE: Make sure to install a patched font:
" https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

colorscheme dracula
