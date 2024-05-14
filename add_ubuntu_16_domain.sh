#!/bin/bash

hostnamectl set-hostname client

sed -i 's/bmy/client/' /etc/hosts
sed -i '/^#/,/allrouters/d' /etc/hosts
echo "10.5.10.90	client" >> /etc/hosts
echo "10.5.10.98        win2019.austral.tld" >> /etc/hosts

apt-get -y install realmd libnss-sss libpam-sss sssd sssd-tools adcli samba-common-bin oddjob oddjob-mkhomedir packagekit ssh
apt-get -y install krb5-user

apt-get -y remove avahi-daemon

rm /etc/resolv.conf
touch /etc/resolv.conf

cat >> /etc/resolv.conf <<EOF

domain AUSTRAL.TLD
search AUSTRAL.TLD
nameserver 10.5.10.98
nameserver 10.5.10.101

EOF

wget https://github.com/BeyondTrust/pbis-open/releases/download/9.1.0/pbis-open-9.1.0.551.linux.x86_64.deb.sh

chmod +x pbis-open-9.1.0.551.linux.x86_64.deb.sh

./pbis-open-9.1.0.551.linux.x86_64.deb.sh

domainjoin-cli join AUSTRAL.TLD administrator

domainjoin-cli query
