#!/bin/bash





#Detecta el ID de los ratones que haya en el sistema.

detector=$(xinput list | awk '/**pointer/{print $3,$4,$5,$6,$7,$8,$9}' | grep -o 'id.*' | cut -f2- -d= | cut -f2- | cut -c 1-2 2> /dev/null)


#Separa los numeros uno a uno y los mete en una variable.

f1=$(echo $detector | awk '{print $1}' 2> /dev/null)
f2=$(echo $detector | awk '{print $2}' 2> /dev/null)
f3=$(echo $detector | awk '{print $3}' 2> /dev/null)
f4=$(echo $detector | awk '{print $4}' 2> /dev/null)
f5=$(echo $detector | awk '{print $5}' 2> /dev/null)


#Desbloquea el raton.

xinput set-prop "$f1" "Device Enabled" 1 2> /dev/null
xinput set-prop "$f2" "Device Enabled" 1 2> /dev/null
xinput set-prop "$f3" "Device Enabled" 1 2> /dev/null
xinput set-prop "$f4" "Device Enabled" 1 2> /dev/null
xinput set-prop "$f5" "Device Enabled" 1 2> /dev/null
