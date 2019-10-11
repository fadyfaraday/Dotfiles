#!/bin/sh
#setup my packages
sudo pacman -S - < pkglist.txt

#vim,zsh and tmux
stow -t ~/ vim zsh tmux  
#i3
stow -t ~/.i3 i3
#compton
stow -t ~/.config compton
#rofi
mkdir ~/.config/rofi && stow -t ~/.config/rofi rofi
#termite
mkdir ~/.config/termite && stow -t ~/.config/termite termite
#install packages from AUR via yay
yay -S ttf-nerd-fonts-symbols ttf-meslo system-san-francisco-font-git otf-font-awesome-4 spotify-adblock-git thunar-thumbnailers waterfox-bin
simplenote-electron-bin spotify  pip-tools google-chrome megasync osx-arc-shadow

