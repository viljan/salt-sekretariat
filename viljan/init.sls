viljan:
  user.present:
    - password: {{ pillar['auth']['viljan']['password'] }}

{{ pillar['hostname'] }}:
  network.system:
    - hostname: {{ pillar['hostname'] }}
