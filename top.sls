base:          # Apply SLS files from the directory root for the 'base' environment
  'viljan*':   # All minions with a minion_id that begins with 'viljan' i.e. all clients
    - client   # Apply the state named 'client'
  'servern':   # The minion running on the server
    - server   # Apply the state named 'server'
    