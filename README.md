# vimrc

My vimrc configuration. Used primarily for Neovim.

## Dependencies

### Plugins:

Some external dependencies are required by vim plugins:

- `Shougo/deoplete.nvim` - Requires python3, pip3 and some packages. Complete requirements can be found [here](https://github.com/Shougo/deoplete.nvim#install)
- `junegunn/fzf` - Requires [fzf](https://github.com/junegunn/fzf) to be installed.
- `ryanoasis/vim-devicons` - Requires a patched font that can be found [here](https://github.com/ryanoasis/nerd-fonts). Make sure that font is installed and used by the terminal that runs Vim.

### Installation notes:

- Make sure that true colors is supported by the terminal. Test is through the `truecolor.sh` script.
- When using with *tmux*, **airline** does not display properly. Make sure that `.tmux.conf` is symlinked and loaded with `tmux source-file ~/.tmux.conf` from the shell.
- Add `.swp` and `.swo` as files to be (globally) ignored by git. 

## Neovim

When using neovim, make sure that the version installed is at least [0.5](https://github.com/neovim/neovim/releases).

Make sure that the contents of this directory are visible in `~/.config/nvim`.

### Telescope

On neovim, [Telescope](https://github.com/nvim-telescope/telescope.nvim) is used instead of `fzf`. It requires the installation of several dependencies, in particular:

- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

### LSP

Individual LSP servers must be installed to enable LSP functionality. Supported languages
can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md).
