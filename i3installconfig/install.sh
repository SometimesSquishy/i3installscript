#!/usr/bin/env bash


echo "make sure this is in home directory plz"
# making sure that script isnt run as root
if ! [[ $(id -u) = 1000 ]]; then
        echo "do not run this script as root pleas sirs,,, may brake computor...."
        exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_NAME=$( basename "$0" )
SCRIPTA=$( echo "$SCRIPT_DIR/$SCRIPT_NAME" )





###sudo usermod -aG wheel $USER
#if you get GMPE error no data run #rm -R /var/lib/pacman/sync

echo "To change login screen pictures go to ~/i3installscript/i3installconfig/etc/LightDmPics/ and change the pictures but keep the same names"

sleep 3

echo "what is your open weather map key? https://home.openweathermap.org/api_keys"
read -r OWMKEY
sed -i "1i APIKEY=$OWMKEY" $HOME/.config/polybar/scripts/weather.sh
sleep 1

echo "what about what city you're in? if not US go change that yourself. also im pretty sure that capitalization doesnt matter for cityname but idk"
read -r CITYNAME
sed -i "1i CITY_NAME=$CITYNAME" $HOME/.config/polybar/scripts/weather.sh
sleep 1

#-_-_-_- Changing pacman config -_-_-_-#
echo 'ParallelDownloads = 5' | sudo tee -a /etc/pacman.conf

sudo pacman -Sy
sudo pacman -Syu

sudo pacman -Syu artix-archlinux-support
sudo pacman-key --populate archlinux

sudo pacman -Sy
sudo cp $SCRIPT_DIR/pacman.conf /etc/pacman.conf
sudo pacman -Sy
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-#



#-_-_-_- Directories for stuff
mkdir -p ~/Tools/scripts
mkdir -p ~/Pictures/Wallpapers
mkdir ~/.config
mkdir -p ~/.config/polybar/scripts
mkdir ~/.config/i3
mkdir ~/.config/newsboat
mkdir ~/.config/picom
mkdir ~/.cache/zsh
mkdir ~/.config/dunst
mkdir ~/.config/lf
mkdir ~/.config/htop
mkdir ~/.config/neofetch
mkdir ~/.config/nvim
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-#


#-_-_-_-_-Cloning Config files.-_-_-_-#

## MAKE IT USE CUR_DIR AND SCRIPT_DIR
cd $SCRIPT_DIR
git clone https://github.com/SometimesSquishy/i3-rice.git
git clone https://github.com/SometimesSquishy/Scripts.git
cd $SCRIPT_DIR/i3-rice
mv configs zshrc $SCRIPT_DIR && cd $SCRIPT_DIR && rm -rf i3-rice
cd


cd
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-#


#-_-_-_-_-Downloading packages.-_-_-_-#


        echo -e "GPU packages to be installed: \nA for AMD, I for intel, or N for nvidia"
                read gpu
case "GPU" in
	a*)echo "Installing open source AMD drivers"; sudo pacman -S xf86-video-amdgpu mesa ;;
	i*) echo "intel IGPU work best with mesa driver"; sudo pacman -S mesa ;;
	n*) echo "Installing nvidia stuff"; sudo pacman -S nvidia nvidia-utils ;;
	*) echo "please input something" ;;
esac



sudo pacman -S alsa-utils arandr base-devel bat blueman caja cmus curl doas duf dunst dust exa fakeroot fd feh firefox flameshot htop i3-gaps i3blocks i3lock i3status kitty lxappearance lightdm-openrc lightdm-gtk-greeter make meson ncdu neofetch neovim newsboat ntfs-3g pacman-contrib picard picom polybar pulseaudio pulseaudio-alsa pulseaudio-bluetooth python-pip qbittorrent redshift resolvconf rofi tor tor-browser unzip unrar obs-studio v4l2loopback-dkms wget xdotool xorg-server xorg-setxkbmap zsh


# adding xinitrc for xorg (the good display manager) #
echo exec i3 | tee /home/$USER/.xinitrc

cd

#installing yay, an AUR helper
cd ~/
git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -si c
cd

#funny packages ig
yay -S cava pulseaudio-control nerd-fonts-complete tlp betterlockscreen lf jq tty-clock-git backlight_control cbonsai nerd-fonts-complete spek-alternative plata-theme pulseaudio-control ttf-all-the-icons sl speedtest-cli imagemagick

## adding earlyoom, then starting it. out of memory killer but better.
yay -S earlyoom-openrc

sudo rc-update add earlyoom
sudo rc-service earlyoom start

# ZSH syntax highlighting

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/
cd



# changing grub theme to artix, this can be changed to near any distro

echo "do you want to change your grub theme? >> y << for yes, enter for no."
read cgrub

if [ "$cgrub" = "y" ]; then
git clone https://github.com/AdisonCavani/distro-grub-themes.git
sudo mkdir /boot/grub/themes
cd distro-grub-themes/customize
sudo cp -r artix/ /boot/grub/themes
sudo cp ~/i3installscript/i3installconfig/etc/grub /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
fi


# firefox extensions, to make it better

#downloading them
mkdir ~/ff-extensions
cd ~/ff-extensions
<<<<<<< HEAD
wget https://addons.mozilla.org/firefox/downloads/file/3906578/clickbait_remover_for_youtube-0.6.1.xpi https://addons.mozilla.org/firefox/downloads/file/3941589/return_youtube_dislikes-3.0.0.1.xpi https://addons.mozilla.org/firefox/downloads/file/3951009/sponsorblock-4.4.1.xpi https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3943310/dark_reader-4.9.50-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3902154/decentraleyes-2.0.17-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3948477/i_dont_care_about_cookies-3.4.0.xpi https://addons.mozilla.org/firefox/downloads/file/3923300/facebook_container-2.3.2-fx.xpi https://addons.mozilla.org/firefox/downloads/file/3927638/clearurls-1.24.1-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3949235/enhancer_for_youtube-2.0.114.1.xpi https://addons.mozilla.org/firefox/downloads/file/3009842/enhanced_h264ify-2.1.0.xpi https://addons.mozilla.org/firefox/downloads/file/3928332/crxviewer-1.6.12.xpi https://addons.mozilla.org/firefox/downloads/file/3770708/violentmonkey-2.13.0.xpi
=======
wget https://github.com/treevar/ThumbSee/releases/download/firefox/ecaadba2b56242cd9258-1.0.xpi https://addons.mozilla.org/firefox/downloads/file/3906578/clickbait_remover_for_youtube-0.6.1.xpi https://addons.mozilla.org/firefox/downloads/file/3941589/return_youtube_dislikes-3.0.0.1.xpi https://addons.mozilla.org/firefox/downloads/file/3951009/sponsorblock-4.4.1.xpi https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3943310/dark_reader-4.9.50-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/4032517/localcdn_fork_of_decentraleyes-2.6.40.xpi https://addons.mozilla.org/firefox/downloads/file/3948477/i_dont_care_about_cookies-3.4.0.xpi https://addons.mozilla.org/firefox/downloads/file/3923300/facebook_container-2.3.2-fx.xpi https://addons.mozilla.org/firefox/downloads/file/3927638/clearurls-1.24.1-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3949235/enhancer_for_youtube-2.0.114.1.xpi https://addons.mozilla.org/firefox/downloads/file/3009842/enhanced_h264ify-2.1.0.xpi https://addons.mozilla.org/firefox/downloads/file/3928332/crxviewer-1.6.12.xpi https://addons.mozilla.org/firefox/downloads/file/3770708/violentmonkey-2.13.0.xpi https://addons.mozilla.org/firefox/downloads/file/4033202/chameleon_ext-0.22.37.1.xpi 
>>>>>>> 44ce215b5f60d792db96e69f05097cc03802f430

#installing them
cd ~/ff-extensions
firefox -install-global-extension *.xpi
cd
rm -rf ~/ff-extensions


# yt-dlp, yt-dl but newer and not api limited, used to download content off near every streaming site
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp


# downloading and installing icons
git clone https://github.com/snwh/faba-icon-theme.git
cd faba-icon-theme
meson "build" --prefix=/usr
sudo ninja -C "build" install


#installing polybar crypto module

cd
git clone https://github.com/willHol/polybar-crypto.git &&
    cd polybar-crypto &&
    mkdir -p ~/.config/polybar &&
    cp ./{crypto-config,crypto.py} ~/.config/polybar &&
    sudo chmod u+x ~/.config/polybar/crypto.py
cd




# neofetch but with searching ips
git clone https://github.com/trakBan/ipfetch.git && cd ipfetch && sudo sh setup.sh





sudo pacman -Syu
cp -r $SCRIPT_DIR/Wallpapers/* ~/Pictures/Wallpapers
rm -rf $SCRIPT_DIR/Scripts/.git $SCRIPT_DIR/Scripts/README.md
cp -r $SCRIPT_DIR/Scripts/* ~/Tools/scripts
cp -r $SCRIPT_DIR/configs/* ~/.config
cp -r $SCRIPT_DIR/zshrc ~/.zshrc
sudo cp $SCRIPT_DIR/etc/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp $SCRIPT_DIR/etc/pcspkr /etc/modprobe.d/nobeep.conf


#-_-_-_-_- doas config -_-_-_-_-#
echo "permit :wheel
permit persist :wheel
permit nopass $USER cmd reboot
permit nopass $USER cmd poweroff
permit nopass $USER cmd tlp
permit nopass $USER cmd wg-quick" | sudo tee -a /etc/doas.conf
#-_-_-_-_-_-_-_-_-#


# Blocks all cringe stuff online other than youtub (maybe controversial for porn addicts)
sudo cp $SCRIPT_DIR/etc/hosts /etc/hosts

sudo nano /etc/doas.conf

cd ~/ && rm -rf distro-grub-themes Watcher yay-git faba-icon-theme


chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/scripts/*
chsh -s /bin/zsh

sudo pacman -Scc
yay -Scc

sudo pacman -Rns xfce4 xfce4-goodies lightdm-greeter lightdm lightdm-openrc lightdm-gtk-greeter sudo
rm -rf ~.config/xfce4
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

#
