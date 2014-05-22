common.deps:
  pkg.installed:
    - pkgs:
      - mercurial
      - git
      - avahi-daemon

ntp:
  service.running
