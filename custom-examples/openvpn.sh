#!/bin/bash

## allow openvpn clients to relay their internet-connection over this host

## note:

# ipv4 forwarding has to be enabled!
# clients have to be able to connect to udp-port 1194


IPTABLES=/sbin/iptables

$IPTABLES -t nat -A POSTROUTING -s 10.8.0.1/2 -o eth0 -j MASQUERADE
