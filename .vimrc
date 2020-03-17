" Basic configuration; c/o vimconfig.com
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

Plug 'itchyny/lightline.vim'
set laststatus=2

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'elixir-editors/vim-elixir'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()
