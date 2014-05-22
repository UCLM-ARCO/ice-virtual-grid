babel:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/arco.list
    - name: deb http://babel.esi.uclm.es/arco sid main
    - key_url: http://babel.esi.uclm.es/arco/key.asc
#    - keyid: DCA26384
#    - keyserver: pgp.mit.edu
    - refresh: True
