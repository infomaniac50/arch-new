#!/bin/bash

source /root/arch-common.sh

ask_yesno "Have you mounted your partitions?" || exit 1

echo "Where should I pacstrap and chroot to?"
echo "Note: We assume no root / has been added. It will be added later automatically."
read ARCHFRESH

pacstrap -i "/$ARCHFRESH" base

genfstab -U -p "/$ARCHFRESH" >> "/$ARCHFRESH/etc/fstab"

edit_pause "Edit your fstab now."
nano "/$ARCHFRESH/etc/fstab"

cp arch-common.sh "/$ARCHFRESH/root/"
cp arch-disk.sh "/$ARCHFRESH/root/"

arch-chroot "/$ARCHFRESH" /root/arch-disk.sh

rm "/$ARCHFRESH/root/arch-common.sh"
rm "/$ARCHFRESH/root/arch-disk.sh"

umount -R "/$ARCHFRESH"

echo ""
echo "All Done! You can reboot now if you want to."