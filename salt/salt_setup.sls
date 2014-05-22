# remove bootstrap salt config
/etc/cron.d/salt:
  file.absent

hg -R /etc/salt-provision pull -u; salt-call --local state.highstate; date > /tmp/last-cron:
  cron.present:
    - user: root
    - minute: '*/5'

root.path:
  cron.env_present:
    - name: PATH
    - value: /usr/bin:/bin:/usr/sbin:/sbin
