#!/bin/bash



usb=/run/media/linux/*/videos/
destino=/home/linux/videos/

cp -r $usb{*.mp4,*.avi,*.mov,*.mpeg,*.mp3} $destino 2> /dev/null

