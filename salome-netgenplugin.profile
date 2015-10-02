export NETGEN_ROOT_DIR=/opt/salome/netgenplugin
export NETGENPLUGIN_ROOT_DIR=/opt/salome/netgenplugin

export PYTHONPATH=$NETGENPLUGIN_ROOT_DIR/lib/python2.7/site-packages/salome:$PYTHONPATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NETGEN_ROOT_DIR/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NETGENPLUGIN_ROOT_DIR/lib/salome

export PATH=$PATH:$NETGEN_ROOT_DIR/bin
export PATH=$PATH:$NETGENPLUGIN_ROOT_DIR/bin/salome
