#!/bin/bash

# symlink the contents of current dir to the ~/.config/nvim
DIR=$(realpath $(dirname $0))
CONF_DIR=$HOME/.config/nvim

if [[ !(-L "$CONF_DIR" && -d "$CONF_DIR") ]]
then
	ln -s $DIR $HOME/.config/nvim
fi
