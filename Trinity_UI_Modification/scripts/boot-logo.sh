#!/bin/bash

cd ~/Trinity-OS/

# make sure you have the packages for plymouth
sudo apt install plymouth -y;

# after downloading or cloning themes, copy the selected theme in plymouth theme dir
sudo cp -r plymouth-themes/pack_2/deus_ex /usr/share/plymouth/themes/

# install the new theme (deus_ex, in this case)
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/deus_ex/deus_ex.plymouth 100

# select the theme to apply
sudo update-alternatives --config default.plymouth
#(select the number for installed theme, deus_ex in this case)

# update initramfs
sudo update-initramfs -u

echo	"
	
		Success! Reboot to see effects. $USER

	"



cd ~


exit
