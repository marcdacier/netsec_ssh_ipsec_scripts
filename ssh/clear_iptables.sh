#!/bin/sh
iptables --flush
iptables --delete-chain
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT