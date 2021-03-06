FROM ubuntu:16.04

COPY ./plex.deb /installer/

RUN apt-get update && apt-get -y install avahi-daemon dbus libssl1.0.0 libssl-dev libva-dev udev && dpkg --install --force-confold /installer/plex.deb

RUN useradd -M -s /bin/bash plex

EXPOSE 32400/tcp 32400/udp 32469 32469/udp 5353/udp 1900/udp

#ENTRYPOINT chown -R plex:plex /var/lib/plexmediaserver && su -c 'LD_LIBRARY_PATH=/usr/lib/plexmediaserver /usr/lib/plexmediaserver/Plex\ Media\ Server' plex

ENTRYPOINT rm -f /home/plex/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid && su -c 'LD_LIBRARY_PATH=/usr/lib/plexmediaserver /usr/lib/plexmediaserver/Plex\ Media\ Server' plex
