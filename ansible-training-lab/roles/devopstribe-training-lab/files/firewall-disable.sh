#!/bin/sh

PATH='/sbin'

# Flush the tables to apply changes
iptables -F

iptables -P FORWARD ACCEPT
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT