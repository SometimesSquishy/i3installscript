# ONLY DO THIS ON ARTIX
# or you could edit the install script to remove replacing mirrors
https://artixlinux.org/download.php
(If u dont want to do a base install use the xfce4 install cuz its the easiest to remove)
# i3installscript
#
# To Install
first install git
```
sudo pacman -S git
```
and then
```
cd ~/ && git clone https://github.com/SometimesSquishy/i3installscript.git
```
# To run
```
cd ~/i3installscript/i3installconfig && chmod +x install.sh && ./install.sh
```

Run this to remove xfce and sudo
```
doas pacman -Rns xfce4 xfce4-goodies sudo
```
