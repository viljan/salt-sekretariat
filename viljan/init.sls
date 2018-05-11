include:
  - auth

keyboard-layout:
  keyboard.system:
    - name: se

/boot/config.txt:
  file.managed:
    - source: salt://viljan/pi.conf
    - mode: 644
