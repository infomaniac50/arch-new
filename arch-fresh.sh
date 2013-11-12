#!/bin/bash

source arch-common.sh

echo "Where should I pacstrap and chroot to?"
echo "Note: We assume no root / has been added. It will be added later automatically."
read ARCHFRESH

pacstrap -i "/$ARCHFRESH" base

genfstab -U -p "/$ARCHFRESH" >> "/$ARCHFRESH/etc/fstab"

edit_pause "Edit your fstab now."
nano "/$ARCHFRESH/etc/fstab"

cp arch-common.sh "/$ARCHFRESH/root/"
cp arch-disk.sh "/$ARCHFRESH/root/"
touch "/$ARCHFRESH/root/.bash_profile"
echo 'echo "Please run /root/arch-disk.sh"' >> "/$ARCHFRESH/root/.bash_profile"

arch-chroot "/$ARCHFRESH" /bin/bash

umount -R "/$ARCHFRESH"
echo "All Done! You can reboot now if you want to."