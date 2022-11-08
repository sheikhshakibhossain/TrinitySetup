#!/bin/bash


# installing essentials
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes gparted -y;


# removing apps
sudo apt remove ksysguard skanlite plasma-discover kwalletmanager ksystemlog usb-creator-kde muon -y;

# housekeeping
sudo apt autoremove -y;
sudo apt autoclean -y;

echo "


             kde mod done


"
exit
