#!/bin/bash/
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F

egrep -i '(allow|permit|port|PasswordAuthentication|pub)' /etc/ssh/sshd_config    
sudo service ssh status
sudo service ssh restart
sudo netstat -plntu
sudo iptables -nv -L --line-numbers

iptables-restore < /root/ipts.save
