#!/usr/bin/env bash

wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
apt-get update
apt-get -y install salt-minion
echo -e "10.0.2.2 salt\n" >> /etc/hosts
