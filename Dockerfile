FROM alpine:latest
MAINTAINER Jeroen van Rhee <jeroen_van_rhee@hotmail.com>

RUN apk update && apk upgrade && \
    apk add --update freeradius && \
    chgrp radius  /usr/sbin/radiusd && \
    chmod g+rwx /usr/sbin/radiusd && \
    rm /var/cache/apk/*

VOLUME \
    /opt/db/ \
    /etc/freeradius/certs

EXPOSE \
    1812/udp \
    1813 \
    18120

CMD ["radiusd","-xx","-f"]

