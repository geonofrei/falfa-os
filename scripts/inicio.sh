#!/bin/bash

sudo rm -rf /etc/profile.d/2live_cd_init.sh
sudo rm -rf /etc/profile.d/live_cd_init.sh
sudo rm -rf /home/linux/Desktop/skype.sh
sudo chmod -R ugo+rwx /home/linux/core/scripts
sudo pacman -Sy --noconfirm
/home/linux/core/scripts/rat_bloqueador.sh
/home/linux/core/scripts/tec_bloqueador.sh
/home/linux/core/scripts/usb_autocopia.sh
wmctrl -s 0
sleep 1
wmctrl -s 1
sleep 2
skypeforlinux
sleep 2
wmctrl -s 0
sleep 1
orden=$(ls -1 /home/linux/videos/{*.mp4,*.avi,*.mov,*.mpeg,*.mp3} 2> /dev/null | sort -k 1)
vlc -L -f $orden













































