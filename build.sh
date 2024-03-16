#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
# rm -rf ${SCRIPTPATH}/airootfs/etc/holoinstall/*zst
source /home/vak/home/holoiso-images/latest_beta.releasemeta
# cp /home/vak/home/holoiso-images/${IMAGEFILE}.img.zst ${SCRIPTPATH}/airootfs/etc/holoinstall
echo ${IMAGEFILE} > /tmp/currentcandidate
sudo mkarchiso -v -w /tmp/$(date +%Y%m%d.%H%M.%S) -o /home/vak/home/holoiso-installer ${SCRIPTPATH}
rclone mkdir drive2:/download/holoiso-installer
rclone copy /home/vak/$(/tmp/currentcandidate)* drive2:/download/holoiso-installer -L --progress