#!/bin/bash

echo ""
echo "BIENVENIDO :) // WELCOME :)"
echo ""
sleep 2
echo ""
echo "¿Qué tipo de conexión a internet quieres usar? ####### ¿Wich type of network connection do you want to use?"
echo ""
select yn in "cable" "wifi"; do
	echo ""
    case $yn in


        cable ) 










echo "";
break;;




        wifi )

echo ""; 
sleep 2;

cd /etc/systemd/network/
touch network1.network
touch network2.network
touch network3.network

networkctl | awk  '{print $2}' > /home/linux/core/interfaces.txt 2> /dev/null; #actualiza el archivo con las interfaces disponibles 


interfaz1=$(sed '3!d' /home/linux/core/interfaces.txt 2> /dev/null); #mete las distintas interfaces en distintas variables
interfaz2=$(sed '4!d' /home/linux/core/interfaces.txt 2> /dev/null); #
interfaz3=$(sed '5!d' /home/linux/core/interfaces.txt 2> /dev/null); #

echo -e "[Match]\nName=$interfaz1\n[Network]\nDHCP=ipv4\n" > network1.network 2> /dev/null
echo -e "[Match]\nName=$interfaz2\n[Network]\nDHCP=ipv4\n" > network2.network 2> /dev/null	
echo -e "[Match]\nName=$interfaz3\n[Network]\nDHCP=ipv4\n" > network3.network 2> /dev/null	

networkctl down $interfaz1;										     #desactiva la interfaz1 y la 3
networkctl up $interfaz2;
networkctl down $interfaz3;
systemctl start NetworkManager;

nmtui																 #inicia el menu selector de red


systemctl start systemd-networkd
systemctl enable systemd-networkd
sed -i 's/^nameserver .*$/nameserver 8.8.8.8/' /etc/resolv.conf

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






#----------------------------------------------------------------------------------------------------

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
			                    
####################################################################################################################

dconf load / < /home/linux/core/portabilidad/mate_config
systemctl enable lightdm
systemctl start lightdm
sleep 3
sudo cp /home/linux/core/scripts/inicio.sh /home/linux/Desktop/
sudo cp /home/linux/core/scripts/skype.sh /home/linux/Desktop/
sudo chmod ugo+rwx /home/linux/Desktop/inicio.sh
sudo chmod ugo+rwx /home/linux/Desktop/skype.sh
sudo chmod ugo+rwx /home/linux/Desktop/01instalacion.sh
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo find /etc/default/grub -type f -exec sed -i "s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g" {} \;

#-----------------------------------------------------------------------#-----------------------------


exit;;
    esac
done



















#habilitar internet 

cd /etc/systemd/network/
touch network1.network
touch network2.network
touch network3.network
networkctl | awk  '{print $2}' > /home/linux/core/interfaces.txt 2> /dev/null
interfaz1=$(sed '3!d' /home/linux/core/interfaces.txt 2> /dev/null)
interfaz2=$(sed '4!d' /home/linux/core/interfaces.txt 2> /dev/null)
interfaz3=$(sed '5!d' /home/linux/core/interfaces.txt 2> /dev/null)

echo -e "[Match]\nName=$interfaz1\n[Network]\nDHCP=ipv4\n" > network1.network 2> /dev/null
echo -e "[Match]\nName=$interfaz2\n[Network]\nDHCP=ipv4\n" > network2.network 2> /dev/null	
echo -e "[Match]\nName=$interfaz3\n[Network]\nDHCP=ipv4\n" > network3.network 2> /dev/null	

networkctl up $interfaz1
networkctl up $interfaz2
networkctl up $interfaz3
systemctl start systemd-networkd
systemctl enable systemd-networkd
sed -i 's/^nameserver .*$/nameserver 8.8.8.8/' /etc/resolv.conf 

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






#----------------------------------------------------------------------------------------------------

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
sleep 3
sudo cp /home/linux/core/scripts/inicio.sh /home/linux/Desktop/
sudo cp /home/linux/core/scripts/skype.sh /home/linux/Desktop/
sudo chmod ugo+rwx /home/linux/Desktop/inicio.sh
sudo chmod ugo+rwx /home/linux/Desktop/skype.sh
sudo chmod ugo+rwx /home/linux/Desktop/01instalacion.sh
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo find /etc/default/grub -type f -exec sed -i "s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g" {} \;



#-----------------------------------------------------------------------#-----------------------------



