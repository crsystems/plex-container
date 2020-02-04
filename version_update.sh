#!/bin/bash
#
# Script to automate the version fetching

curl 'https://plex.tv/downloads/details/1?build=linux-ubuntu-x86_64&channel=public&distro=ubuntu' | grep "<Release" | sed 's/^.*version="\([0-9]\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*-[0-9a-f]*\)".*$/\1/' > .version
