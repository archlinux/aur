export NETGEN_ROOT_DIR=/opt/salome
export NETGENPLUGIN_ROOT_DIR=/opt/salome

_pythonver=2.7
_netgen_path=$NETGEN_ROOT_DIR/bin/salome
_netgenplugin_path=$NETGENPLUGIN_ROOT_DIR/bin/salome
_netgen_librarypath=$NETGEN_ROOT_DIR/lib
_netgenplugin_librarypath=$NETGENPLUGIN_ROOT_DIR/lib/salome
_netgenplugin_pythonpath=$NETGENPLUGIN_ROOT_DIR/lib/python${_pythonver}/site-packages/salome

# PYTHONPATH
if [[ $PYTHONPATH != *${_netgenplugin_pythonpath}* ]]; then
  export PYTHONPATH=${_netgenplugin_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_netgen_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_netgen_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_netgenplugin_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_netgenplugin_librarypath}:$LD_LIBRARY_PATH
fi

# PATH
if [[ $PATH != *${_netgen_path}* ]]; then
  export PATH=${_netgen_path}:$PATH
fi
if [[ $PATH != *${_netgenplugin_path}* ]]; then
  export PATH=${_netgenplugin_path}:$PATH
fi
