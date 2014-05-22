#!/usr/bin/env bash

wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
cp /shared/bootstrap/salt.list /etc/apt/sources.list.d/
apt-get update
apt-get -y install salt-minion mercurial

hg clone https://bitbucket.org/arco_group/ice-virtual-grid /etc/salt-provision

cat > /etc/salt/minion <<EOF
file_client: local
file_roots:
  base:
    - /etc/salt-provision/salt
EOF
