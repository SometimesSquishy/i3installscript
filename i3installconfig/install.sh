#!/bin/sh

echo "hope this works"
sleep 1
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syu artix-archlinux-support --noconfirm
sudo pacman-key --populate archlinux --noconfirm
sudo pacman -Sy
sudo cp ~/i3installscript/i3installconfig/pacman.conf /etc/pacman.conf
sudo pacman -Sy
sudo pacman -Syu --noconfirm
mkdir ~/Tools
mkdir ~/Tools/bin
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
mkdir ~/.config/newsboat
mkdir ~/.config/picom

sudo pacman -S i3-gaps i3blocks i3lock i3status polybar pulseaudio-bluetooth rofi caja htop make fakeroot firefox flameshot tor tor-browser resolvconf pacman-contrib ntfs-3g feh neofetch base-devel make newsboat pulseaudio lxappearance blueman arandr kitty zsh newsboat neovim qbittorrent pulseaudio-alsa alsa-utils doas picom cmus redshift base-devel curl wget xdotool --noconfirm

git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -si c

yay -S cava jellyfin-media-player pulseaudio-control lf tty-clock-git backlight_control cbonsai plata-theme pulseaudio-control ttf-all-the-icons sl speedtest-cli --noconfirm

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/
cd
git clone https://github.com/Waishnav/Watcher
cd ./Watcher/
./install
cd

git clone https://github.com/AdisonCavani/distro-grub-themes.git
sudo mkdir /boot/grub/themes
cd distro-grub-themes/customize
sudo cp -r artix/ /boot/grub/themes
sudo cp ~/i3installscript/i3installconfig/etc/grub /etc/default/grub


sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

sudo pacman -Syu
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
sudo cp -r ~/i3installscript/i3installconfig/etc/LightDmPics /usr/share/backgrounds
sudo cp ~/i3installscript/i3installconfig/etc/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp ~/i3installscript/i3installconfig/etc/lightdm-gtk-greeter.conf /etc/lightdm
sudo cp ~/i3installscript/i3installconfig/etc/pcspkr /etc/modprobe.d/nobeep.conf
sudo cp ~/i3installscript/i3installconfig/etc/doas /etc/doas.conf

sudo nano /etc/doas.conf

cd ~/ && rm -rf distro-grub-themes Watcher i3installscript yay-git

mkdir ~/.cache/zsh
chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh

doas pacman -Scc --noconfirm
yay -Scc --noconfirm

clear

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

