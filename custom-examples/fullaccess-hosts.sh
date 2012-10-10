#!/bin/bash

## Allow some hosts fullaccess to this box.
## good for hosts like the sysadmins workstation or a monitoring-box

## configuration:
## add the hashtag #fullaccess to host's line in /etc/hosts

## example:

# 192.168.20.55    admin-workstation.example.com    admin-workstation    #fullaccess

# hint: you could use the whitelist configfile to achieve the same goal

IPTABLES=/sbin/iptables

for d in `cat /etc/hosts | grep "#fullaccess" | awk '{ print $1 }'`; do
  $IPTABLES -A INPUT -s $d -m state --state NEW -j ACCEPT
done;
