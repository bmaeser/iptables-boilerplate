#!/bin/bash

## Limit the amount of NEW connections on port 80
## to a maximum of $CONNECTIONS per $SECONDS per remote-ip
## this is usefull, if someone tries to DOS or synflood your box
## and helps to prevent dictonary-attacks

## this rule does NOT open port 80. it just drops "too many attempts" on port 80


## we allow at max 2 new connections per second
CONNECTIONS=2
SECONDS=1


IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --set
$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --update --seconds $SECONDS --hitcount $CONNECTIONS -j DROP