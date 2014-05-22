zeroc-ice35:
  pkg.installed

icegridnode:
  pkg.installed:
    - require:
      - pkgrepo: babel
  service.running:
    - require:
      - pkg: icegridnode
      - file: /etc/default/icegridnode
    - watch:
      - file: /etc/icegridnode.conf

/etc/default/icegridnode:
  file.managed:
    - source: salt://etc/default/icegridnode
