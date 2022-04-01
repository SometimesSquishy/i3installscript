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

sudo pacman -S i3-gaps i3blocks i3lock i3status polybar rofi htop firefox ntfs-3g feh neofetch newsboat pulseaudio lxappearance blueman arandr kitty zsh newsboat neovim pulseaudio-alsa alsa-utils doas picom cmus redshift base-devel curl wget xdotool
yay -S cava backlight_control cbonsai plata-theme pulseaudio-control ttf-all-the-icons
sudo echo permit :wheel > /etc/doas.conf
sudo echo permit persist :wheel > /etc/doas.conf
sudo echo permit nopass $USER cmd reboot > /etc/doas.conf
sudo echo permit nopass $USER cmd poweroff > /etc/doas.conf

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/
cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd
doas curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
doas chmod a+rx /usr/local/bin/yt-dlp

doas pacman -Syu
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
mkdir .cache/zsh
chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh
doas pacman -Rns sudo

echo "rebooting, switch to i3 on login screen, ctrl c to cancel reboot."
sleep 1
echo "oh ya also say bye bye to sudo cuz now its time for doas"
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
doas reboot

