ice-hello.deps:
  pkg.installed:
    - pkgs:
      - g++-4.7
      - openjdk-7-jdk
      - libdb5.3-java
      - mono-devel

https://bitbucket.org/arco_group/ice-hello:
  hg.latest:
    - target: /tmp/ice-hello
    - user: vagrant
    - force: true
