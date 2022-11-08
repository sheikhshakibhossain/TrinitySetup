#!/bin/bash


sudo apt update && sudo apt install qt5-style-kvantum qt5-style-kvantum-themes -y
sudo apt remove ksysguard skanlite plasma-discover kwalletmanager ksystemlog usb-creator-kde muon -y;
sudo apt remove thunderbird vlc -y
sudo apt autoremove -y
sudo apt autoclean -y;
sudo apt install wget net-tools software-properties-gtk tar codeblocks htop -y;
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb;
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb;
sudo apt --fix-broken install -y;
wget https://raw.githubusercontent.com/skbtemp12/Trinity-OS/main/scripts/update
chmod +x update 
sudo apt install curl neofetch vim -y
sudo mv update /usr/bin
sudo apt install git mpv -y
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
clear
cd ..
update
git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd linux-firmware/
cd amdgpu/
sudo cp * /lib/firmware/amdgpu && sudo update-initramfs -k all -u -v
sudo update-initramfs -u -k all
update
cd ..
cd ~
ls
rm -rf google-chrome-stable_current_amd64.deb onlyoffice-desktopeditors_amd64.deb linux-firmware/ 
sudo updatedb
ls

sudo rm -rf auto-cpufreq/
cd ~


cd /usr/bin
sudo rm xterm
sudo cp konsole xterm


cd /tmp
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz;
tar -xf xdm-setup-7.2.11.tar.xz;
sudo ./install.sh;
rm -rf install.sh readme.txt xdm-setup-7.2.11.tar.xz;
ls
sudo updatedb



cd /tmp
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


cd ~
sudo cp bashrc ~/.bashrc
sudo chmod +x c
sudo chmod +x run
sudo cp c /usr/bin
sudo cp run /usr/bin



# fix boot time
sudo systemctl disable NetworkManager-wait-online.service
