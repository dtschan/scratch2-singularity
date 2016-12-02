FROM centos:6

RUN yum -y install \
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
        sudo \
        wget \
        Xvfb && \
        yum clean all

# libDCOP.so.4 \
RUN useradd scratchy && \
    echo -e "Defaults:scratchy !requiretty\nscratchy ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/scratchy && \
    chmod 0440 /etc/sudoers.d/scratchy

USER scratchy
WORKDIR /home/scratchy
ENV HOME /home/scratchy

RUN mkdir -p /home/scratchy/Downloads /home/scratchy/Documents && \
    cd /home/scratchy/Downloads && \
    wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin && \
    chmod +x AdobeAIRInstaller.bin && \
    wget https://scratch.mit.edu/scratchr2/static/sa/Scratch-451.air && \
    chmod +x Scratch-451.air && \
    ( Xvfb :1 & ) && \
    export DISPLAY=:1 && \
    sudo /home/scratchy/Downloads/AdobeAIRInstaller.bin -silent -eulaAccepted /home/scratchy/Downloads/Scratch-451.air && \
    sudo ln -s /opt/Scratch\ 2/bin/Scratch\ 2 /usr/bin/scratch && \
    rm -f /home/scratchy/Downloads/*

CMD /usr/bin/scratch
