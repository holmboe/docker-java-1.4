FROM centos:5

MAINTAINER SungKwang Song <saltfactory@gmail.com>

RUN mkdir -p /var/cache/yum/{base,extras,updates,libselinux} && \
    echo "http://vault.centos.org/5.11/os/x86_64/" > /var/cache/yum/base/mirrorlist.txt && \
    echo "http://vault.centos.org/5.11/extras/x86_64/" > /var/cache/yum/extras/mirrorlist.txt && \
    echo "http://vault.centos.org/5.11/updates/x86_64/" > /var/cache/yum/updates/mirrorlist.txt && \
    echo "http://vault.centos.org/5.11/centosplus/x86_64/" > /var/cache/yum/libselinux/mirrorlist.txt

RUN yum -y install ld-linux.so.2

ADD ./j2sdk-1_4_2_19-linux-i586-rpm.bin /
RUN chmod +x /j2sdk-1_4_2_19-linux-i586-rpm.bin
RUN (echo yes) | sh /j2sdk-1_4_2_19-linux-i586-rpm.bin
RUN rpm -Uvh /j2sdk-1_4_2_19-linux-i586.rpm

ENV JAVA_HOME /usr/java/j2sdk1.4.2_19
ENV PATH $PATH:$JAVA_HOME/bin

VOLUME /data
