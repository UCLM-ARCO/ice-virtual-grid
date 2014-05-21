zeroc-ice35:
  pkg.installed



##--- manager ---
#
#redmine:
#  pkg.installed:
#    - require:
#      - pkg: apache2
#
#apache2:
#  pkg:
#    - installed
#  service.running:
#    - watch:
#      - cmd: mod-ssl
#      - cmd: mod-passenger
#      - cmd: disable-site-default
#      - cmd: site-redmine
#      - file: /etc/apache2/sites-available/redmine
#      - file: /etc/apache2/ports.conf
#      - file: /etc/ssl/certs/arco
#
#mod-ssl:
#  cmd.run:
#    - name: a2enmod ssl
#    - unless: ls /etc/apache2/mods-enabled/ssl.conf
#    - creates: /etc/apache2/mods-enabled/ssl.conf
#
#mod-passenger:
#  cmd.wait:
#    - name: a2enmod passenger
#    - watch:
#      - pkg: libapache2-mod-passenger
#    - creates: /etc/apache2/mods-enabled/passenger.conf
#    - unless: ls /etc/apache2/mods-enabled/passenger.conf
#
#libapache2-mod-passenger:
#  pkg.installed
#
#disable-site-default:
#  cmd.run:
#    - name: a2dissite 000-default
#    - onlyif: ls /etc/apache2/sites-enabled/000-default
#
#site-redmine:
#  cmd.run:
#    - name: a2ensite redmine
#    - creates: /etc/apache2/sites-enabled/redmine
#    - unless: ls /etc/apache2/sites-enabled/redmine
#    - watch:
#      - file: /etc/apache2/sites-available/redmine
#
#/etc/apache2/sites-available/redmine:
#  file.managed:
#    - source: salt://redmine/etc/apache2/sites-available/redmine
#
#/etc/apache2/ports.conf:
#  file.managed:
#    - source: salt://redmine/etc/apache2/ports.conf
#
#/etc/ssl/certs/arco:
#  file.recurse:
#    - source: salt://etc/ssl/certs/arco
#    - clean: True
#
#
##--- authentication ---
#
#arco-user:
#  pkg.installed:
#    - skip_suggestions: True
#    - skip_verify: True
#    - require:
#      - pkgrepo: babel
#    - require:
#      - pkg: ldap-depends
#
#ldap-depends:
#  pkg.installed:
#    - pkgs:
#      - libnss-db
#      - libnss-ldap
#      - libpam-ccreds
#      - libpam-krb5
#      - libpam-ldap
#      - nss-updatedb
#      - libimage-exiftool-perl
#
## FIXME: provide ldap conf instead of run arco-auth
#remote-auth:
#  cmd.run:
#    - name: arco-auth remote
#    - require:
#      - pkg: arco-user
#
#
##--- redmine pam authentication ---
#
#libpam0g-dev:
#  pkg.installed
#
#rpam-ruby19:
#  gem.installed:
#    - require:
#      - pkg: libpam0g-dev
#
#/usr/share/redmine/app/models/auth_source_pam.rb:
#  file.managed:
#    - source: salt://redmine/files/auth_source_pam.rb
#
#/usr/share/redmine/Gemfile.local:
#  file.managed:
#    - contents: |
#        gem 'rpam-ruby19'
#
#/usr/share/redmine/Gemfile.lock:
#  file.managed:
#    - mode: 666
#
#
#redmine-pam-plugin:
#  cmd.run:
#    - name: echo -e "insert into auth_sources values (NULL, 'AuthSourcePam', 'Pam', 'localhost', 1, 'user', 'pass', 'app', 'name', 'firstname', 'lastname', 'email', 1, 0, null);" | sqlite3 /var/lib/dbconfig-common/sqlite3/redmine/instances/default/redmine_default
#    - unless: echo -e "select * from auth_sources where type='AuthSourcePam';" | sqlite3 /var/lib/dbconfig-common/sqlite3/redmine/instances/default/redmine_default | grep Pam
#    - require:
#      - gem: rpam-ruby19
#      - file: /var/lib/dbconfig-common/sqlite3/redmine/instances/default/redmine_default
#
#
##--- redmine arco theme ---
#
#/usr/share/redmine/public/themes/arco/stylesheets/application.css:
#  file.managed:
#    - source: salt://redmine/files/application.css
#
#
##--- config, database and mail ---
#
#/var/lib/dbconfig-common/sqlite3/redmine/instances/default/redmine_default:
#  file.symlink:
#    - target: /shared/redmine_default
#    - force: True
#    - group: www-data
