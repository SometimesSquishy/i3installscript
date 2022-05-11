# need to have it echo in use flags
# ones i need USE="dbus alsa curl i3wm ipc network ncurses portaudio pulseaudio sdl Xinerama -systemd -gnome -kde"




echo "Run this once you have made a user and are logged in under it with sudo or doas installed"
sleep 2

cd

mkdir ~/Tools
mkdir ~/Tools/bin
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
mkdir -p ~/.config/picom
mkdir -p ~/.cache/zsh
mkdir ~/.config/dunst
mkdir ~/.config/i3
mkdir ~/.config/polybar
mkdir ~/.config/polybar/scripts
mkdir ~/.config/

cd ~/i3installscript/i3installconfig
git clone https://github.com/SometimesSquishy/i3-rice.git
cd ~/i3installscript/i3installconfig/i3-rice
mv configs scripts zshrc ~/i3installscript/i3installconfig && cd ~/i3installscript/i3installconfig && rm -rf i3-rice

# Xorg install
sudo emerge x11-libs/libX11 x11-base/xorg-server x11-apps/xinit x11-libs/libXrandr x11-libs/libXinemerama x11-libs/libXft x11-apps/xrdb x11-apps/mesa-progs x11-apps/xrandr x11-misc/arandr x11-drivers/x386-video-amdgpu x11-misc/unclutter x11-misc/xclip

# Assorted useful stuff
sudo emerge dev-vcs/git app-editors/neovim media-sound/alsautils media-fonts/fontawesome media-gfx/feh x11-misc/pcmanfm

# Desktop enviroment
sudo emerge x11-wm/i3-gaps x11-misc/polybar x11-misc/rofi x11-misc/picom x11-misc/dunst

# Sound Related

sudo emerge media-sound/cmus media-sound/cava

# Random Packages

cd

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting/


# changing grub
git clone https://github.com/AdisonCavani/distro-grub-themes.git
sudo mkdir /boot/grub/themes
cd distro-grub-themes/customize
sudo cp -r gentoo/ /boot/grub/themes
sudo cp ~/i3installscript/i3installconfig/etc/grub /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg


# copying configs and stuff
cp -r ~/i3installscript/i3installconfig/Wallpapers/* ~/Pictures/Wallpapers
cp -r ~/i3installscript/i3installconfig/scripts/* ~/Tools/bin
cp -r ~/i3installscript/i3installconfig/configs/* ~/.config
cp -r ~/i3installscript/i3installconfig/zshrc ~/.zshrc
sudo cp ~/i3installscript/i3installconfig/etc/pcspkr /etc/modprobe.d/nobeep.conf
sudo cp ~/i3installscript/i3installconfig/etc/doas /etc/doas.conf



chmod +x ~/.config/polybar/scripts/*
chmod +x ~/Tools/bin/*
chsh -s /bin/zsh

#finally the most important part
sudo emerge neofetch
