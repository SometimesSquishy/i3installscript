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
cd ~/yay-git
makepkg -si c
cd
sudo pacman -Syu
mkdir ~/Tools
mkdir ~/Tools/bin
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
sudo pacman -S i3-gaps i3blocks i3lock i3status polybar rofi htop firefox ntfs-3g feh newsboat pulseaudio lxappearance arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils picom cmus redshift base-devel curl wget xdotool

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/

cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
yay -S cava backlight_control cbonsai plata-theme pulseaudio-control
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
mkdir .cache/zsh
chmod +x ~/.config/polybar/scripts/*
chsh -s /bin/zsh
echo "rebooting, switch to i3 on login screen."
sleep 2
sudo reboot


