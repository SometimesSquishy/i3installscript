#!/bin/sh
pacman -Syu artix-archlinux-support
echo "hope this works"
sleep 1
rm /etc/pacman.conf
cp ~/i3installconfig/pacman.conf /etc/pacman.conf
pacman -Sy
cd
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si c
cd
pacman -Syu
mkdir ~/Tools
mkdir ~/Tools/bin
pacman -S i3-gaps i3blocks i3lock i3status polybar rofi firefox ntfs-3g pulseaudio lxappearance arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils picom cmus redshiftbase-devel curl wget xdotool

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/

cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
yay -S cava backlight_control

cp ~/i3installconfig/scripts/* ~/Tools/bin
cp ~/i3installconfig/configs ~/.config
cp ~/i3installconfig/zshrc ~/.zshrc
reboot


