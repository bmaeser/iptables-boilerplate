#!/bin/bash

## Limit the amount of NEW connections 
## to a maximum of $CONNECTIONS per $SECONDS per remote-ip
## this is usefull, if someone tries to DOS or synflood your box
## and helps to prevent dictonary-attacks


## we allow at max 120 new connections per minute
CONNECTIONS=120
SECONDS=60


IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp -m state --state NEW -m recent --set
$IPTABLES -A INPUT -p tcp -m state --state NEW -m recent --update --seconds $SECONDS --hitcount $CONNECTIONS -j DROP