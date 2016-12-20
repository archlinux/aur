export NETGEN_ROOT_DIR=/opt/salome
export NETGENPLUGIN_ROOT_DIR=/opt/salome

_netgenplugin_pythonver=2.7
_netgen_path=$NETGEN_ROOT_DIR/bin/salome
_netgenplugin_path=$NETGENPLUGIN_ROOT_DIR/bin/salome
_netgen_librarypath=$NETGEN_ROOT_DIR/lib
_netgenplugin_librarypath=$NETGENPLUGIN_ROOT_DIR/lib/salome
_netgenplugin_pythonpath=$NETGENPLUGIN_ROOT_DIR/lib/python${_netgenplugin_pythonver}/site-packages/salome

# PYTHONPATH
if [[ $PYTHONPATH != ${_netgenplugin_pythonpath} && $PYTHONPATH != *:${_netgenplugin_pythonpath}&& $PYTHONPATH != ${_netgenplugin_pythonpath}:* && $PYTHONPATH != *:${_netgenplugin_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_netgenplugin_pythonpath}
    else
	export PYTHONPATH=${_netgenplugin_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_netgenplugin_librarypath} && $LD_LIBRARY_PATH != *:${_netgenplugin_librarypath} && $LD_LIBRARY_PATH != ${_netgenplugin_librarypath}:* && $LD_LIBRARY_PATH != *:${_netgenplugin_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_netgenplugin_librarypath}
    else
	export LD_LIBRARY_PATH=${_netgenplugin_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_netgen_librarypath} && $LD_LIBRARY_PATH != *:${_netgen_librarypath} && $LD_LIBRARY_PATH != ${_netgen_librarypath}:* && $LD_LIBRARY_PATH != *:${_netgen_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_netgen_librarypath}
    else
	export LD_LIBRARY_PATH=${_netgen_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_netgenplugin_path} && $PATH != *:${_netgenplugin_path} && $PATH != ${_netgenplugin_path}:* && $PATH != *:${_netgenplugin_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_netgenplugin_path}
    else
	export PATH=${_netgenplugin_path}:$PATH
    fi
fi
if [[ $PATH != ${_netgen_path} && $PATH != *:${_netgen_path} && $PATH != ${_netgen_path}:* && $PATH != *:${_netgen_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_netgen_path}
    else
	export PATH=${_netgen_path}:$PATH
    fi
fi
