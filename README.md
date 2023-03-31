# vimrc

My vimrc configuration. Used primarily for Neovim.

## Installation notes:

Make sure that the Neovim version installed is at least [0.7](https://github.com/neovim/neovim/releases).

Make sure that the contents of this directory are visible in `~/.config/nvim`.

### Plugins:

Make sure that [Plug](https://github.com/junegunn/vim-plug) is installed.

Some external dependencies are required by vim plugins:

- `gcc`, `clang`, etc - Required by `nvim-treesitter`
  - can be installed with `sudo apt install build-essential` in Ubuntu installations
- `Telescope` - requires the following:
  - [fd](https://github.com/sharkdp/fd)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)

### LSP

Individual LSP servers must be installed to enable LSP functionality. Supported languages
can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

### Other notes:

- The scripts `init.sh` and `install.sh` (must be run as root) are included to automate some of the steps described above.
- Make sure that true colors is supported by the terminal. Test is through the `truecolor.sh` script.
- When using with *tmux*, **airline** does not display properly. Make sure that `.tmux.conf` is symlinked and loaded with `tmux source-file ~/.tmux.conf` from the shell.
- Add `.swp` and `.swo` as files to be (globally) ignored by git. 
