#!/bin/bash

cd /root
git clone https://github.com/holoiso-staging/holoiso-installer
cp -R /root/holoiso-installer/* /
cd -
chmod +x -R /usr/bin /etc/lib /etc/X11 /home/liveuser/Desktop
systemctl enable sddm