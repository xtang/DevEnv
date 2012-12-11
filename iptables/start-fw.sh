#!/bin/bash

iptables -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -m multiport --destination-ports 22,80,443 -j ACCEPT
iptables -A INPUT -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
