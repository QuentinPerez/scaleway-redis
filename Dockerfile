## -*- docker-image-name: "scaleway/webmin:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install Redis
RUN apt-get update \
 && apt-get upgrade -y -q \
 && apt-get install -y -q \
    redis-server redis-tools \
 && apt-get clean


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
