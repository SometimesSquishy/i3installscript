#!/bin/sh


echo "what is your open weather map key? https://openweathermap.org/api"
read -r OWM-KEY
echo $OWM-KEY >> $HOME/.config/polybar/owm-key

sleep 1
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syu artix-archlinux-support 
sudo pacman-key --populate archlinux 
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
mkdir ~/.cache/zsh
mkdir ~/.config/dunst
mkdir ~/.config/lf

cd ~/i3installscript/i3installconfig
git clone https://github.com/SometimesSquishy/i3-rice.git
cd ~/i3installscript/i3installconfig/i3-rice
mv configs scripts zshrc ~/i3installscript/i3installconfig && cd ~/i3installscript/i3installconfig && rm -rf i3-rice

sudo pacman -S alsa-utils arandr base-devel bat blueman caja cmus curl doas duf dunst dust exa fakeroot feh firefox flameshot htop i3-gaps i3blocks i3lock i3status kitty lxappearance make meson neofetch neovim newsboat ntfs-3g pacman-contrib picom polybar pulseaudio pulseaudio-alsa pulseaudio-bluetooth qbittorrent redshift resolvconf rofi tor tor-browser unzip wget xdotool zsh
git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -si c
cd

yay -S cava pulseaudio-control nerd-fonts-complete tlp betterlockscreen lf jq tty-clock-git backlight_control cbonsai spek-alternative plata-theme pulseaudio-control ttf-all-the-icons sl speedtest-cli imagemagick

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

sudo grub-mkconfig -o /boot/grub/grub.cfg

git clone https://github.com/trakBan/ipfetch.git && cd ipfetch && sudo sh setup.sh

#firefox extensions

#downloading them
mkdir ~/ff-extensions
cd ~/ff-extensions
wget https://addons.mozilla.org/firefox/downloads/file/3951009/sponsorblock-4.4.1.xpi https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3943310/dark_reader-4.9.50-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3902154/decentraleyes-2.0.17-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3948477/i_dont_care_about_cookies-3.4.0.xpi https://addons.mozilla.org/firefox/downloads/file/3923300/facebook_container-2.3.2-fx.xpi https://addons.mozilla.org/firefox/downloads/file/3927638/clearurls-1.24.1-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3949235/enhancer_for_youtube-2.0.114.1.xpi

#installing them
cd ~/ff-extensions
firefox -install-global-extension *.xpi
cd
rm -rf ~/ff-extensions 


sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

git clone https://github.com/snwh/faba-icon-theme.git
cd faba-icon-theme
meson "build" --prefix=/usr
sudo ninja -C "build" install


sudo pacman -Syu
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
sudo cp -r ~/i3installscript/i3installconfig/etc/LightDmPics/* /usr/share/backgrounds
sudo cp ~/i3installscript/i3installconfig/etc/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp ~/i3installscript/i3installconfig/etc/lightdm-gtk-greeter.conf /etc/lightdm
sudo cp ~/i3installscript/i3installconfig/etc/pcspkr /etc/modprobe.d/nobeep.conf
sudo cp ~/i3installscript/i3installconfig/etc/doas /etc/doas.conf

sudo nano /etc/doas.conf

cd ~/ && rm -rf distro-grub-themes Watcher yay-git faba-icon-theme


chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh

sudo pacman -Scc --noconfirm
yay -Scc --noconfirm

sudo pacman -Rns xfce4 xfce4-goodies
clear

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
doas reboot

