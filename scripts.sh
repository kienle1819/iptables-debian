#!/bin/bash
# Script install iptables debian

echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
apt-get install -y iptables-persistent
ln -s /etc/init.d/netfilter-persistent /etc/init.d/iptables
cd /etc/iptables
cp /root/iptables-debian/rules.v4 rules.v4
cp -p /root/iptables-debian/rc.local /etc/rc.local
systemctl start netfilter-persistent
systemctl status netfilter-persistent
