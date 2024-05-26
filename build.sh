#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BRANCH="$1"
if [[ -z "$BRANCH" ]]; then
    echo "Branch unable to find."
    exit 0
fi
BUILDDIR=$2
if [[ -z "$BUILDDIR" ]]; then
    echo "Builds unable to find."
    exit 0
fi
INSTALLDIR="${BUILDDIR}/holoiso-installer/${BRANCH}"
mkdir -p $INSTALLDIR
rm -rf ${SCRIPTPATH}/airootfs/etc/holoinstall/*zst
source ${BUILDDIR}/holoiso-images/latest_$BRANCH.releasemeta
mkdir -p ${SCRIPTPATH}/airootfs/etc/holoinstall
cp ${BUILDDIR}/holoiso-images/${IMAGEFILE}.img.zst ${SCRIPTPATH}/airootfs/etc/holoinstall
echo ${IMAGEFILE} > /tmp/currentcandidate
sudo mkarchiso -v -w /tmp/$(date +%Y%m%d.%H%M.%S) -o ${INSTALLDIR} ${SCRIPTPATH}
rm -rf ${SCRIPTPATH}/airootfs/etc/holoinstall/*zst
