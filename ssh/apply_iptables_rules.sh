#!/bin/sh
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
#Allow only incoming SSH connections from c1, where 192.168.122.81 is the IP address of c1
iptables -A FORWARD -s 192.168.122.81 -i eth1 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth2 -m state --state NEW,ESTABLISHED -p tcp --sport 22 -j ACCEPT
#Allow only incoming SSH connections from s3, where 20.20.20.55 is the IP address of s3
iptables -A FORWARD -s 20.20.20.55 -i eth2 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth1 -m state --state NEW,ESTABLISHED -p tcp --sport 22 -j ACCEPT