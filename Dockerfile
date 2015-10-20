## -*- docker-image-name: "scaleway/webmin:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install Redis
RUN apt-get update \
 && apt-get upgrade -y -q \
 && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
 && apt-get install -y -q \
    apache2-utils \
    nginx \
    nodejs \
    redis-server \
    redis-tools \
    supervisor \
 && apt-get clean

RUN npm install -g redis-commander

# Configure NginX
RUN ln -sf /etc/nginx/sites-available/redis-commander /etc/nginx/sites-enabled/redis-commander \
 && rm -f /etc/nginx/sites-enabled/default

ADD ./patches/etc/ /etc/
ADD ./patches/root/ /root/
ADD ./patches/usr/local/ /usr/local/

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
