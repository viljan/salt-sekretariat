# salt minion setup
1. Depending on the distribution you are running, install by `apt-get install salt-minion` or equivalent. (Follow the instructions at https://repo.saltstack.com/)
2. In the file /etc/salt/minion, uncomment `master: salt` and replace *salt* with your salt master hostname if it's not *salt*.
3. In the file /etc/hosts, add a line containing the IP address and the hostname of the salt master, like ´10.0.2.7       saltmaster´.

Repeat the steps above for each minion you want to control from the master.

# salt master setup 
1. Depending on the distribution you are running, install by `apt-get install salt-master salt-minion python-pygit2` or equivalent. (Follow the instructions at https://repo.saltstack.com/)
2. In the file /etc/salt/master:
  1. Set `fileserver_backend` to `git`
  2. Set  `gitfs_provider` to `pygit2`.
  3. Set `gitfs_remote` to `git://github.com/viljan/salt-sekretariat.git`.
3. Restart the salt-master
4. List all minions trying to authenticate with the master by running `salt-key -L`
5. Accept all unaccepted keys by running `salt-key -A`
