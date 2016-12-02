FROM centos:6

ADD install.sh /tmp
RUN /tmp/install.sh
 
USER scratchy

ENTRYPOINT /usr/bin/scratch
