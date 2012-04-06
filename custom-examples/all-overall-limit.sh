#!/bin/bash

## Limit the amount of connections on per remote-ip

CONNECTIONS=30

IPTABLES=/sbin/iptables

$IPTABLES -A INPUT -p tcp --syn -m connlimit --connlimit-above $CONNECTIONS -j REJECT