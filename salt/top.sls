base:
  'node*':
    - salt_setup
    - babel
    - common
    - ice
    - ice-hello

  'node1':
    - icegrid_registry

  'node2':
    - icegrid_node
