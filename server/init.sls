oracle-repo:
  pkgrepo.managed:
    - humanname: WebUpd8 Oracle Java PPA repository
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/webupd8team-java.list
    - keyid: EEA14886
    - keyserver: keyserver.ubuntu.com

oracle-license-select:
  debconf.set:
    - name: oracle-java8-installer
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': 'true'}
        
oracle-jre:
  pkg.installed:
    - name: oracle-java8-installer
    - require:
      - pkgrepo: oracle-repo

ola-server:
  user.present:
    - name: ola
  archive.extracted:
    - name: /home/ola/server
    - source: https://sokviljan.se/files/ola-5.4.1.zip
    - source_hash: 3b595d9561842860e0fa1a161309ea0f
    - user: ola
    - group: ola
  file.managed:
    - name: /home/ola/server/launch.sh
    - source: salt://server/conf/ola-server
    - user: ola
    - group: ola
    - mode: 755
  file.symlink:
    - name: /home/viljan/Skrivbord/OLA-Server
    - target: /home/ola/server/launch.sh

mysql-server:
  pkg.installed:
    - name: mysql-server
