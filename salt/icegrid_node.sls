/etc/icegridnode.conf:
  file.managed:
    - source: salt://etc/icegridnode.conf-node.jinja
    - template: jinja
