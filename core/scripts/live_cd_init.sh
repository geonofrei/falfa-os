#!/bin/bash


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Cosas que quedan por hacer que no sean scripts, (apuntes, ideas)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


#-Poner en airrootfs una carpetita que tenga dentro archivos de configuracion que usa falfa, ademas de fondo de pantalla y demas
#14-01-2021-(Ya la puse, esta en /home/linux/core/portabilidad)

#a;adir opcion a los pacman pa que no pregunten
#14-01-2021-(Hecho)

#poner esto al final cuando haya ejecutado todos los comandos >>
#echo -e "root\nroot" | passwd root

#Crear instalador 

#dar permisos recursivos a la ruta /home/linux/core/scripts












#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


#--------------------------------------------------------------------------------------------------

#habilitar internet 

cd /etc/systemd/network/
touch network1.network
touch network2.network
touch network3.network
networkctl | awk  '{print $2}' > /home/linux/core/interfaces.txt 2> /dev/null
interfaz1=$(sed '3!d' /home/linux/core/interfaces.txt 2> /dev/null)
interfaz2=$(sed '3!d' /home/linux/core/interfaces.txt 2> /dev/null)
interfaz3=$(sed '3!d' /home/linux/core/interfaces.txt 2> /dev/null)

echo -e "[Match]\nName=$interfaz1\n[Network]\nDHCP=ipv4\n" > network1.network 2> /dev/null
echo -e "[Match]\nName=$interfaz2\n[Network]\nDHCP=ipv4\n" > network2.network 2> /dev/null	
echo -e "[Match]\nName=$interfaz3\n[Network]\nDHCP=ipv4\n" > network3.network 2> /dev/null	

networkctl up $interfaz1
networkctl up $interfaz2
networkctl up $interfaz3
systemctl start systemd-networkd
systemctl enable systemd-networkd


#---------------------------------------------------------------------------------------------------

#editar etc/pacman.d/pacman.conf y habilitar servidor espa;ol para poder descargar (hacer script que te habilite automaticamente segun el pais que elijas)

server1=$(cat /etc/pacman.d/mirrorlist | awk '/Spain/{getline; print}') 
server2=$(cat /etc/pacman.d/mirrorlist | awk '/Spain/{getline; getline; print}') 
server3=$(cat /etc/pacman.d/mirrorlist | awk '/Spain/{getline; getline; getline; print}') 
server4=$(cat /etc/pacman.d/mirrorlist | awk '/Spain/{getline; getline; getline; getline; print}') 

sercrudo1=$(echo "$server1" | sed -e 's/^#//g' >> /home/linux/core/srver.txt)
sercrudo2=$(echo "$server2" | sed -e 's/^#//g' >> /home/linux/core/srver.txt)
sercrudo3=$(echo "$server3" | sed -e 's/^#//g' >> /home/linux/core/srver.txt)
sercrudo4=$(echo "$server4" | sed -e 's/^#//g' >> /home/linux/core/srver.txt)

cat /home/linux/core/srver.txt >> /etc/pacman.d/mirrorlist






----------------------------------------------------------------------------------------------------

pacman -Sy --noconfirm                                          	#actualiza los servers
pacman-key --init                                  				#los demas hacen cosas de firmas electronicas e instalan skype
pacman -Sy archlinux-keyring --noconfirm                        	
pacman -Sy --noconfirm
pacman -Sy
pacman -U /home/linux/core/binarioskype/skypeforlinux-stable-bin-8.67.0.96-1-x86_64.pkg.tar.zst --noconfirm
pacman -U /home/linux/core/binarioskype/yay-git-10.1.2.r2.g607d287-1-x86_64.pkg.tar.zst --noconfirm



#-----------------------------------------------------------------------#----------------------------



#-----------------------------------------------------------------------#------------------------------

#-Ponerle contra a usuario linux y a usuario root

echo -e "linux\nlinux" | passwd linux	#seguramente este vacia, osea "linux\nlinux".
#-----------------------------------------------------------------------#------------------------------

#-Establecer una contra para el usuario root *dejar penultimo*

echo -e "root\nroot" | passwd root

#-----------------------------------------------------------------------#-----------------------------

#-restablecer mate *dejar lo ultimo*

mount -o remount,size=2G /run/archiso/cowspace                          #proporciona mas espacio a la live iso
###############################################################################################################
pacman -Sy --noconfirm                                          	
pacman-key --init                                  				
pacman -Sy archlinux-keyring --noconfirm                        	
pacman -Sy --noconfirm
pacman -Sy
pacman -U /home/linux/core/binarioskype/skypeforlinux-stable-bin-8.67.0.96-1-x86_64.pkg.tar.zst --noconfirm 
pacman -U /home/linux/core/binarioskype/yay-git-10.1.2.r2.g607d287-1-x86_64.pkg.tar.zst --noconfirm    

#tengo 16 años, no soy programador, pero se que 																											#poniendo estas lineas de codigo solo arriba no 																													                                          #funcionaban, y poniendolas aqui si, por lo que 																												                                                     #aqui se quedan, si no te gusta no mires. 
####################################################################################################################

dconf load / < /home/linux/core/portabilidad/mate_config
systemctl enable lightdm
systemctl start lightdm
chmod -R ugo+rwx /home/linux/core/scripts/
cp /home/linux/core/scripts/inicio.sh /home/linux/Desktop/


#-----------------------------------------------------------------------#-----------------------------




















#-instalar skype (A partir de aqui solo cosas sin root)

#cd /home/linux
#git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git
#chown -R linux:linux /home/linux/
#cd /home/linux/skypeforlinux-stable-bin
#makepkg -si --noconfirm



#----------------------------------------------------------------------------------------------------















