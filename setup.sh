#!/bin/bash

#
#Starting with updates to ensure everthing runs well.
#

apt update
apt updgrade -y

apt install software-properties-common -y

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

add-apt-repository ppa:philip.scott/elementary-tweaks -y
add-apt-repository ppa:yunnxx/elementary -y
add-apt-repository ppa:agornostal/ulauncher -y
add-apt-repository ppa:linuxuprising/apps -y
apt update

#apt install firefox -y
apt install google-chrome-stable -y
apt install neofetch -y
apt install python -y
apt install gnome-disk-utility -y
apt install gnome-system-monitor -y
apt install gdebi -y
apt install unrar -y
apt install snapd -y
apt install pavucontrol -y
apt install tlp -y
apt install tlpui -y
apt install net-tools -y
apt install hashcat -y
apt install git -y
apt install ulauncher -y
apt install elementary-tweaks -y
apt install indicator-application wingpanel-indicator-ayatana -y

tlp start

#
#Enable Displaying System Tray Icons
#
sed -i -e 's/OnlyShowIn=Unity;GNOME;/OnlyShowIn=Unity;GNOME;Pantheon;/g' /etc/xdg/autostart/indicator-application.desktop
mv /etc/xdg/autostart/nm-applet.desktop /etc/xdg/autostart/nm-applet.desktop.old

#
#This section is used for detection of audio hardware that isn't being recognized during boot.
#If you don't see you sound devive in the settings or see No Output Avilable Uncomment this section.
#

echo "GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet splash acpi_backlight=vendor acpi_osi='!Windows 2013' acpi_osi='!Windows 2012' snd_hda_intel.dmic_detect=0\"" >> /etc/default/grub
rm /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg


#
#This section is used for deletion of default apps in favour of custome ones.
#If you wish to have these apps then uncomment as nessesary.
#

apt remove epiphany-browser -y
apt purge pantheon-mail -y
apt remove noise -y


#
#Installing Snap Packages
#

snap install mailspring

#
#Installing FlatPacks
#

flatpak install flathub org.signal.Signal -y
flatpak install flathub org.wireshark.Wireshark -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub com.spotify.Client -y
#flatpak install flathub com.visualstudio.code -y
flatpak install flathub org.kde.ark -y

#
#This section is used for perserving your SSD uncomment if your system has enough ram and has an SSD.
#If your computer doesn't have good enough specs this may lead to crashes and apps not working.
#

swapoff -a

###############
#End of script#
###############
reboot
