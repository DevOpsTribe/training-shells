#!/bin/sh

PATH='/sbin'

# Flush the tables to apply changes
iptables -F

# # Allow established connections (the responses to our outgoing traffic)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

iptables -A OUTPUT -p tcp -d deb.debian.org -j ACCEPT
iptables -A OUTPUT -p tcp -d github.com -j ACCEPT
iptables -A OUTPUT -p tcp -d docker.io -j ACCEPT
iptables -A OUTPUT -p tcp -d 140.82.121.4 -j ACCEPT
iptables -A OUTPUT -p tcp -d  205.251.193.165 -j ACCEPT
iptables -A OUTPUT -p tcp -d  198.51.44.8 -j ACCEPT
iptables -A OUTPUT -p tcp -d  198.51.45.8 -j ACCEPT
iptables -A OUTPUT -p tcp -d  198.51.44.72 -j ACCEPT
iptables -A OUTPUT -p tcp -d  198.51.45.72 -j ACCEPT
iptables -A OUTPUT -p tcp -d  140.82.121.3 -j ACCEPT
iptables -A OUTPUT -p tcp -d  185.199.108.133 -j ACCEPT

iptables -A INPUT -s 10.10.10.0/24 -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Default policy to drop 'everything' but our output to internet
iptables -P FORWARD DROP
iptables -P INPUT   DROP
iptables -P OUTPUT  DROP
