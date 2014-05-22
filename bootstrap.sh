#!/usr/bin/env bash

cp /shared/bootstrap/salt.list /etc/apt/sources.list.d/
cp /shared/bootstrap/salt.cron /etc/cron.d/salt

wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
apt-get update
apt-get -y install salt-minion mercurial

hg clone https://bitbucket.org/arco_group/ice-virtual-grid /etc/salt-provision

cat > /etc/salt/minion <<EOF
file_client: local
EOF


# file_roots:
#   base:
#     - /etc/salt-provision/salt
