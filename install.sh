#!/usr/bin/sh

MYNEOVIM=~/.config/myneovim
export MYNEOVIM

rm -rf "$MYNEOVIM"

mkdir -p "$MYNEOVIM"/share
mkdir -p "$MYNEOVIM"/nvim

stow --restow --target="$MYNEOVIM"/nvim .

alias mynv="XDG_DATA_HOME=$MYNEOVIM/share XDG_CACHE_HOME=$MYNEOVIM XDG_CONFIG_HOME=$MYNEOVIM nvim"
