#!/bin/bash


# Installing essentials
sudo apt install wget software-properties-gtk -y;


# installing spotify

echo	"

		installing spotify...

	"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y;


# installing chrome

echo	"

		installing chrome...

	"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# installing protonvpn

echo "

		installing protonvpn

"

wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb
sudo apt update
sudo apt install protonvpn -y;
sudo apt install gnome-shell-extension-appindicator gir1.2-appindicator3-0.1 -y;
grep '/usr/s\?bin' /etc/systemd/system/display-manager.service


# installing onlyoffice

echo "


		installing onlyoffice...


"

wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb;
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb;
sudo apt --fix-broken install -y;


# installing xdm

echo "

	
		installing xdm...


"

sudo apt install tar -y;
cd /tmp
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz;
tar -xf xdm-setup-7.2.11.tar.xz;
sudo ./install.sh;
rm -rf install.sh readme.txt xdm-setup-7.2.11.tar.xz;
cd ~



exit
