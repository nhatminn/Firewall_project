#!/bin/bash

#flushing out old rules
iptables -F
iptables -X

#Setting up default policies 
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

#Allow for loopback interface
iptables -A INPUT -i lo -j ACCEPT

#Allow for established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#Allow SSH connections
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#Allow for HTTP and HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

#Blocking pings
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

#Log and drop everything else
iptables -A INPUT -j LOG --log-prefix "IPtables-dropped: " --log-level 4
iptables -A INPUT -j DROP

#Saving logs to a file
dmesg | grep "IPtables-dropped: " > logs/firewall.log

echo "Firewall rules applied!"

