#!/bin/bash

source /root/arch-common.sh

arch_term

echo LANG=$LANG > /etc/locale.conf

touch /etc/vconsole.conf
echo KEYMAP=us >> /etc/vconsole.conf
echo FONT=Lat2-Terminus16 >> /etc/vconsole.conf

echo "Enter your timezone"
while read TIMEZONE
do

if [[ -f "/usr/share/zoneinfo/$TIMEZONE" ]]; then
    ln -s "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
    break
else
    echo "Not a valid timezone. Try Again."
fi

done

hwclock --systohc --utc

read -p "Enter a hostname for this system:" HOSTNAME

echo $HOSTNAME > /etc/hostname

ask_yesno "Would you like to enable DHCP." && systemctl enable dhcpcd.service

ask_yesno "Would you like to set a root password?" && passwd

pacman -S syslinux --noconfirm
syslinux-install_update -i -a -m 

edit_pause "Edit your syslinux config now."
nano /boot/syslinux/syslinux.cfg