#!/bin/bash

# changing repo to backports for latest updates

sudo add-apt-repository ppa:kubuntu-ppa/backports;
sudo apt update
sudo apt full-upgrade -y;
sudo apt autoremove -y;



exit
