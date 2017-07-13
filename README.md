# salt minion setup
1. Depending on the distribution you are running, install by `apt-get install salt-minion` or equivalent. (Follow the instructions at https://repo.saltstack.com/)
2. In the file /etc/salt/minion, uncomment `master: salt` and replace *salt* with your salt master hostname if it's not *salt*.
3. In the file /etc/hosts, add a line containing the IP address and the hostname of the salt master, like ´10.0.2.7       saltmaster´.

Repeat the steps above for each minion you want to control from the master.

# salt master setup 
1. Depending on the distribution you are running, install by `apt-get install salt-master` or equivalent. (Follow the instructions at https://repo.saltstack.com/)
2. List all minions trying to authenticate with the master by running `salt-key -L`
3. Accept all unaccepted keys by running `salt-key -A`
