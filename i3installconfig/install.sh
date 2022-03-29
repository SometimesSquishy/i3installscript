#!/bin/sh

echo "hope this works"
sleep 1
pacman -Syu artix-archlinux-support
pacman-key --populate archlinux
pacman -Sy
cp ~/i3installscript/i3installconfig/pacman.conf /etc/pacman.conf
pacman -Sy
cd
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si c
cd
pacman -Syu
mkdir ~/Tools
mkdir ~/Tools/bin
pacman -S i3-gaps i3blocks i3lock i3status polybar rofi firefox ntfs-3g pulseaudio lxappearance arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils picom cmus redshift base-devel curl wget xdotool --no-confirm

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/

cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
yay -S cava backlight_control cbonsai plata-theme --no-confirm

cp ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp ~/i3installscript/i3installconfig/configs ~/.config
cp ~/i3installscript/i3installconfig/zshrc ~/.zshrc
reboot


