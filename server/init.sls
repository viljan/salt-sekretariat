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
  archive.extracted:
    - name: /opt/ola
    - source: https://sokviljan.se/files/ola-5.4.1.zip
  file.managed:
    - name: /usr/bin/ola-server
    - source: salt://server/conf/ola-server
    - mode: 755
