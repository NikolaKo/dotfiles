#! /bin/sh

## Copies config files from dotfiles repo to proper locations

#zsh
cp ./shell/.zshrc ~/.zshrc

#xresources
cp ./.Xresources ~/.Xresources
xrdb ~/.Xresources

#i3
cp ./i3/config ~/.config/i3/config

#vim
cp ./vim/.vimrc ~/.vimrc

#termite
cp ./termite/config ~/.config/termite/config
