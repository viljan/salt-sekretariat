openssh-server:
  pkg.installed

keyboard-layout:
  keyboard.system:
    - name: se

/boot/config.txt:
  file.managed:
    - source: salt://pi/pi.conf
    - mode: 644

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://pi/sshd.conf
    - mode: 644

pi:
  user.absent:
   - purge: true
   - force: true

{% for key in pillar['auth']['keys'] %}
{{ key }}:
  ssh_auth.present:
    - user: root
    - require_in:
      - pi
{% endfor %}
