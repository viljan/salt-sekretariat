viljan:
  user.present:
    - password: {{ pillar['auth']['password'] }}

{{ pillar['hostname'] }}:
  network.system:
    - hostname: {{ pillar['hostname'] }}
