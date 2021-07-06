#!/bin/bash
dir="$(pwd)"

ln -sf $dir/.zshrc ~/.zshrc
ln -sf $dir/.zshenv ~/.zshenv
ln -sf $dir/.zsh.greet ~/.zsh.greet
ln -sf $dir/.zsh.aliases ~/.zsh.aliases
ln -sf $dir/.zsh.functions ~/.zsh.functions

ln -sf $dir/.vimrc ~/.vimrc
[[ ! -d $dir/.vim ]] && cp -rv $dir/.vim ~/.vim

ln -sf $dir/.muttrc ~/.muttrc
ln -sf $dir/.config/mutt ~/.config/mutt

mkdir -p ~/.config/i3
ln -sf $dir/.config/i3/config ~/.config/i3/

mkdir -p ~/.config/alacritty
ln -sf $dir/.config/alacritty/alacritty.yml ~/.config/alacritty/
ln -sf $dir/.config/alacritty/alacritty.tiny.yml ~/.config/alacritty/

ln -sf $dir/.tmux.conf ~/.tmux.conf
