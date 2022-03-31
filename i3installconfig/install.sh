#!/bin/sh

echo "hope this works"
sleep 1
sudo pacman -Syu artix-archlinux-support
sudo pacman-key --populate archlinux
sudo pacman -Sy
sudo cp ~/i3installscript/i3installconfig/pacman.conf /etc/pacman.conf
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
mkdir ~/.config/newsboat

sudo pacman -S i3-gaps i3blocks i3lock i3status polybar rofi htop firefox ntfs-3g feh neofetch newsboat pulseaudio lxappearance blueman arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils picom cmus redshift base-devel curl wget xdotool
yay -S cava backlight_control cbonsai plata-theme pulseaudio-control ttf-all-the-icons

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/
cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
sudo pacman -Syu
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
mkdir .cache/zsh
chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh


echo "rebooting, switch to i3 on login screen, ctrl c to cancel reboot."
sleep 1
echo "reboot in 5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "0"
sudo reboot


