# ONLY DO THIS ON ARTIX
# or you could edit the install script to remove replacing mirrors
https://artixlinux.org/download.php
(If u dont want to do a base install use the xfce4 install cuz its the easiest to remove)
# i3installscript
#
# To Install
first install git make and fakeroot
```
sudo pacman -S git make fakeroot
```
and then
```
cd ~/ ; git clone https://github.com/SometimesSquishy/i3installscript.git
```
# To run
```
cd ~/i3installconfig; sudo ./install.sh
```
