#!/bin/bash

## Limit the amount of NEW connections on port 80
## to a maximum of $CONNECTIONS per $SECONDS per remote-ip
## this is usefull, if someone tries to DOS or synflood your box
## and helps to prevent dictonary-attacks

## this rule does NOT open port 80. it just drops "too many attempts" on port 80

## hint: if you get messages like "xt_recent: hitcount (120) is larger than packets to be remembered (20)"
## the xt_recent kernel module (called ipt_recent on some systems) is set to remeber only 20 connections
## see: https://github.com/bmaeser/iptables-boilerplate/issues/1#issuecomment-8935056


## we allow at max 8 new connections per second
CONNECTIONS=8
SECONDS=1


IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --set
$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --update --seconds $SECONDS --hitcount $CONNECTIONS -j DROP
