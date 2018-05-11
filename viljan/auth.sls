/etc/ssh/sshd_config:
  file.managed:
    - source: salt://viljan/sshd.conf
    - mode: 644

viljan:
  user.present:
    - password: {{ pillar['auth']['viljan']['password'] }}

pi:
  user.absent:
   - purge: true
   - force: true
   - require:
    - viljan

{% for key in pillar['auth']['root']['keys'] %}
{{ key }}:
  ssh_auth.present:
    - user: root
    - require_in:
      - pi
{% endfor %}
