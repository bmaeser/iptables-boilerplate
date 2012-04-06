#!/bin/bash

## Limit the amount of NEW connections on port 22
## to a maximum of $CONNECTIONS per $SECONDS per remote-ip
## this is usefull, if someone tries to DOS or synflood your box
## and helps to prevent dictonary-attacks

## this rule does NOT open port 22. it just drops "too many attempts" on port 22


## we allow at max 5 new connections per minute
CONNECTIONS=5
SECONDS=60


IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds $SECONDS --hitcount $CONNECTIONS -j DROP