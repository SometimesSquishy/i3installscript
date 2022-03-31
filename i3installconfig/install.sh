#!/bin/sh

echo "hope this works"
sleep 1
sudo pacman -Syu artix-archlinux-support
sudo pacman-key --populate archlinux
sudo pacman -Sy
cp ~/i3installscript/i3installconfig/pacman.conf /etc/pacman.conf
sudo pacman -Sy
cd
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si c
cd
sudo pacman -Syu
mkdir ~/Tools
mkdir ~/Tools/bin
sudo pacman -S i3-gaps i3blocks i3lock i3status polybar rofi firefox ntfs-3g feh newsboat pulseaudio lxappearance arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils picom cmus redshift base-devel curl wget xdotool

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/

cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
yay -S cava backlight_control cbonsai plata-theme pulseaudio-control --no-confirm

cp ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp ~/i3installscript/i3installconfig/configs/* ~/.config
cp ~/i3installscript/i3installconfig/zshrc ~/.zshrc
mkdir .cache zsh
chmod +x ~/.config/polybar/scripts/*.*
reboot


