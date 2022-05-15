# i3installscript


# ONLY DO THIS ON ARTIX
# or you could edit the install script to remove replacing mirrors
https://artixlinux.org/download.php
<p>&nbsp;</p>


# Screenshots


<p align="center">
  <img src="https://github.com/SometimesSquishy/i3installscript/blob/main/Screenshots/2022-04-23_21-24_1.png">
</p>

<p align="center">
  <img src="https://github.com/SometimesSquishy/i3installscript/blob/main/Screenshots/2022-04-23_21-24.png">
</p>


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
<p>&nbsp;</p>
<p>&nbsp;</p>

# Add Another disc to your install
to add another disc go to your fstab and add
```
UUID= ENTER DRIVE UUID /DRIVE MOUNT POINT         ext4    defaults,noatime 0 0
```
udisksctl mount -b

restart then
```
sudo chmod -Rv a+w /DRIVE MOUNT POINT
```
