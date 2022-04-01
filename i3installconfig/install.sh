#!/bin/sh

echo "hope this works"
sleep 1
sudo pacman -Syu artix-archlinux-support --noconfirm
sudo pacman-key --populate archlinux --noconfirm
sudo pacman -Sy
sudo cp ~/i3installscript/i3installconfig/pacman.conf /etc/pacman.conf
sudo pacman -Sy
cd
sudo pacman -Syu --noconfirm
mkdir ~/Tools
mkdir ~/Tools/bin
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
mkdir ~/.config/newsboat

sudo pacman -S i3-gaps i3blocks i3lock i3status polybar rofi caja htop firefox ntfs-3g feh neofetch base-devel make newsboat pulseaudio lxappearance blueman arandr kitty zsh newsboat neovim qbittorrent pulseaudio-alsa alsa-utils doas picom cmus redshift base-devel curl wget xdotool --noconfirm

git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -si c

yay -S cava backlight_control cbonsai plata-theme pulseaudio-control ttf-all-the-icons sl speedtest-cli --noconfirm

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
sudo cp ~/i3installscript/i3installconfig/etc/lightdm-gtk-greeter.conf /etc/lightdm
cp ~/i3installscript/i3installconfig/etc/pcspkr /etc/modprobe.d/nobeep.conf
cp ~/i3installscript/i3installconfig/etc/doas /etc/doas.conf
sudo nano /etc/doas.conf


mkdir .cache/zsh
chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh
doas pacman -Rns sudo xfce4 xcfe4-goodies
doas pacman -Scc --noconfirm
yay -Scc --noconfirm

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

