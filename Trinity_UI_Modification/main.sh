#!/bin/bash

# moding kde plasma
chmod +x kde-mod.sh;
sudo ./kde-mod.sh;
cd scripts
chmod +x *

# installing update automation
sudo cp -r update /usr/bin/

# modifying system to get latest packages
#sudo ./system-mod.sh


# Windows app support
#sudo ./wine-setup.sh


# changing boot logo
sudo ./boot-logo.sh


# changing grub theme
sudo ./grub-theme.sh


# android support
#sudo ./anbox-setup.sh

# playstore support



sudo apt autoremove -y

