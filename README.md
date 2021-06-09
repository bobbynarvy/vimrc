# vimrc

My vimrc configuration

## Dependencies

### Plugins:

Some external dependencies are required by vim plugins:

- `Shougo/deoplete.nvim` - Requires python3, pip3 and some packages. Complete requirements can be found [here](https://github.com/Shougo/deoplete.nvim#install)
- `junegunn/fzf` - Requires [fzf](https://github.com/junegunn/fzf) to be installed.
- `ryanoasis/vim-devicons` - Requires a patched font that can be found [here](https://github.com/ryanoasis/nerd-fonts). Make sure that font is installed and used by the terminal that runs Vim.

### Installation notes:

- When using with *tmux*, **airline** does not display properly. Make sure that `set -g default-terminal "screen-256color"` is set on `~/.tmux.conf`. 
Do not forget to reload tmux with the configuration with `tmux source-file ~/.tmux.conf` from the shell.
- Add `.swp` and `.swo` as files to be (globally) ignored by git. 

## Neovim

When using neovim, make sure that the version installed is at least [0.5](https://github.com/neovim/neovim/releases).

Also make sure that `init.vim` is created in order to load `.vimrc`. Instructions can be found [here](https://neovim.io/doc/user/nvim.html#nvim-from-vim).

### Telescope

On neovim, [Telescope](https://github.com/nvim-telescope/telescope.nvim) is used instead of `fzf`. It requires the installation of several dependencies, in particular:

- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
