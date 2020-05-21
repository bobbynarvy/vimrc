# vimrc

My vimrc configuration

## Dependencies

### Plugins:

- `Shougo/deoplete.nvim` - Requires python3, pip3 and some packages. Complete requirements can be found [here](https://github.com/Shougo/deoplete.nvim#install)
- `ryanoasis/vim-devicons` - Requires a patched font that can be found [here](https://github.com/ryanoasis/nerd-fonts). Make sure that font is installed and used by the terminal that runs Vim.

### Installation notes:

- When using with *tmux*, **airline** does not display properly. Make sure that `set -g default-terminal "screen-256color"` is set on `~/.tmux.conf`
