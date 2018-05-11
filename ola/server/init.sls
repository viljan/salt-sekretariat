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
    - name: {{ pillar['ola']['user'] }}
  archive.extracted:
    - name: {{ pillar['ola']['path'] }}
    - source: {{ pillar['ola']['archive_path'] }}/ola-{{ pillar['ola']['version'] }}.zip
    - source_hash: {{ pillar['ola']['archive_hash'] }}
    - user: {{ pillar['ola']['user'] }}
    - group: {{ pillar['ola']['user'] }}
  file.managed:
    - name: /home/{{ pillar['viljan']['user'] }}/Skrivbord/OLA-Server
    - source: salt://server/conf/ola-server
    - user: {{ pillar['ola']['user'] }}
    - group: {{ pillar['ola']['user'] }}
    - mode: 775
    - template: jinja

mysql-server:
  pkg.installed:
    - name: mysql-server
