#!/bin/bash

sudo dpkg --add-architecture i386;

wget -nc https://dl.winehq.org/wine-builds/winehq.key;

sudo apt-key add winehq.key;

sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main';

sudo apt update -y;

sudo apt install --install-recommends winehq-stable -y;

sudo apt install wine-stable winehq-stable -y;

dpkg-reconfigure wine-stable-amd64 wine-stable wine-stable-i386;

sudo ln -s /usr/share/doc/wine-stable/examples/wine.desktop /usr/share/applications/





exit
