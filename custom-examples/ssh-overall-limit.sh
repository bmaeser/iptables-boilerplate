#!/bin/bash

## Limit the amount of connections on port 22 per remote-ip

## this rule does NOT open port 22. it just drops "too many connections" on port 22

CONNECTIONS=5

IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above $CONNECTIONS -j REJECT