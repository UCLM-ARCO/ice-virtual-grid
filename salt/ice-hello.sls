mercurial:
  pkg.latest

https://bitbucket.org/arco_group/ice-hello:
  hg.latest:
    - target: /tmp/ice-hello
    - user: vagrant
    - force: true
    - require:
      - pkg: mercurial

ice-hello.deps:
  pkg.installed:
    - g++-4.7:
    - libdb5.1-java
    - mono-devel
