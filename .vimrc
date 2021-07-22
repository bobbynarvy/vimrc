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

if exists('+termguicolors')
  set termguicolors
endif

" -------
" Plugins
" -------

" Install plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

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

if has('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
else
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif

" Git-related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language-related plugins
Plug 'neovim/nvim-lspconfig'

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

lua <<EOF
-- nvim-treesitter config; more at :help nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "clojure", "graphql", "hcl", "html",
    "javascript", "json", "ruby", "rust", "typescript",
    "yaml"
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  }
}

-- nvim-lspconfig config
-- Config info can be found here:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
require'lspconfig'.tsserver.setup{}
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'LD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'Ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'Lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'LR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'Lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap("n", "Lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" --------------
" Key remappings
" --------------

" Remap :tabprev and :tabnext
nnoremap gh gT
nnoremap gl gt

" Remap window switching
nnoremap HH <C-W>h
nnoremap JJ <C-W>j
nnoremap KK <C-W>k
nnoremap LL <C-W>l

" --------
" Commands
" --------

" Shortcuts for Telescope
if has('nvim')
  command Tf Telescope find_files hidden=true
  command Tg Telescope live_grep 
  command Tb Telescope buffers 
  command Th Telescope help_tags 
endif
