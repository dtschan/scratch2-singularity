#!/bin/sh -e

SCRATCH2_VERSION=453

yum -y install \
    ld-linux.so.2 \
    gtk2-devel.i686 \
    libdbus-glib-1.so.2 \
    libhal.so.1 \
    rpm-devel.i686 \
    libXt.so.6 \
    gnome-keyring-devel.i686 \
    libxml2-devel.i686 \
    nss-devel.i686 \
    PackageKit-gtk-module.i686 \
    libcanberra-gtk2.i686 \
    nspluginwrapper.i686 \
    gtk2-engines.i686 \
    libxslt \
    libxslt.i686 \
    patch

yum -y install Xvfb
    
useradd scratchy

mkdir -p /home/scratchy/Downloads /home/scratchy/Documents
cd /home/scratchy/Downloads
curl -L -O http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin
chmod +x AdobeAIRInstaller.bin
curl -L -O https://scratch.mit.edu/scratchr2/static/sa/Scratch-${SCRATCH2_VERSION}.air
chmod +x Scratch-${SCRATCH2_VERSION}.air

Xvfb :1 &
export DISPLAY=:1
/home/scratchy/Downloads/AdobeAIRInstaller.bin -silent -eulaAccepted /home/scratchy/Downloads/Scratch-${SCRATCH2_VERSION}.air
cd /opt/Scratch\ 2/share/locale
patch </tmp/de-wedo2.po.patch
ln -s /opt/Scratch\ 2/bin/Scratch\ 2 /usr/bin/scratch
rm -f /home/scratchy/Downloads/*

chown -R scratchy.scratchy /home/scratchy

yum -y history undo last 
yum clean all
