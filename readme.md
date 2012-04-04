# iptables-boilerplate
rock solid default firewall-rules for webhosts

## What is this?
iptables-boilerplate is a set of predefined firewall rules that are typically used on "webhosts".
its not a set of rules, designed to secure your home or office-network or to setup a router or gatweay.
think of "lamp"-servers.

#### iptables-boilerplate is tested on
* Debian 5.0 / Lenny (oldstable)
* Debian 6.0 / Squeeze (stable)
* Debian 7.0 / Wheezy (testing)
* Ubuntu 10.04 LTS / Lucid
* Ubuntu 10.10 / Maverick
* Ubuntu 11.04 / Natty
* Ubuntu 11.10 / Oneiric
* Ubuntu 12.04 - BETA1 / Precise

#### Features
* rock solid defaults
* easy extendable
* one-line opening ports
* one line whitelisting ips
* one line blacklisting ips
* extensively documented (inline comments)

## Installation

create necessary directories first
    
    sudo mkdir /etc/firewall
    sudo mkdir /etc/firewall/custom

checkout the github repo and install the files

    git clone git://github.com/bmaeser/iptables-boilerplate.git
    cd iptables-boilerplate
    sudo cp firewall /etc/init.d/firewall
    sudo cp *.conf /etc/firewall/
    
make sure firewall ist executable and update runnlevels

    sudo chmod 755 /etc/init.d/firewall
    sudo update-rc.d firewall defaults
    
## Configuration

All configuration-files are to be found at /etc/firewall/

Feel free to read the firewall-script itself and comment/uncomment what you like or dislike.

#### services.conf
This file is used to open ports for services like ssh or http(s) in your firewall.

SYNTAX:

PORT/PROTOCOLL SOURCE
where SOURCE is the source ip or network
n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.
if SOURCE is empty it defaults to 0.0.0.0/0 (which is any IP)

EXAMPLEs:

opens ports for SSH for IP 192.168.0.1:

    22/tcp 192.168.0.1
    22/udp 192.168.0.1

opens ports for HTTP for any IP

    80/tcp 0.0.0.0/0

opens ports for HTTPS for any IP

    443/tcp

#### ip-whitelist.conf:
Add all source IPs you want to have full access to this host.
One IP per line

SYNTAX:
n.n.n.n/m.m.m.m  - Where n.n.n.n is the IP address range and m.m.m.m is the netmask.
n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.

EXAMPLEs:

    192.168.0.1
    192.168.1.0/8
    192.168.55.0/255.255.255.148
    
#### ip-blacklist.conf:
Add all source IPs you want to COMPLETELY BLOCK
One IP per line

SYNTAX:
n.n.n.n/m.m.m.m  - Where n.n.n.n is the IP address range and m.m.m.m is the netmask.
n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.

EXAMPLEs:

    192.168.0.1
    192.168.1.0/8
    192.168.55.0/255.255.255.148
    
#### custom/*:
Every file/script you place here will be executed during firewall-start.
Place your custom rules in here.