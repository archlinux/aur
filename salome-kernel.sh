# module var
export KERNEL_ROOT_DIR=/opt/salome

# local vars
_kernel_pythonver=2.7
_kernel_path=$KERNEL_ROOT_DIR/bin/salome
_kernel_pythonpath=$KERNEL_ROOT_DIR/lib/python${_kernel_pythonver}/site-packages/salome:$_kernel_path
_kernel_librarypath=$KERNEL_ROOT_DIR/lib/salome

# PATH
if [[ $PATH != ${_kernel_path} && $PATH != *:${_kernel_path} && $PATH != ${_kernel_path}:* && $PATH != *:${_kernel_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PATH=${_kernel_path}
    else
	export PATH=${_kernel_path}:$PATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_kernel_librarypath} && $LD_LIBRARY_PATH != *:${_kernel_librarypath} && $LD_LIBRARY_PATH != ${_kernel_librarypath}:* && $LD_LIBRARY_PATH != *:${_kernel_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_kernel_librarypath}
    else
	export LD_LIBRARY_PATH=${_kernel_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PYTHONPATH
if [[ $PYTHONPATH != ${_kernel_pythonpath} && $PYTHONPATH != *:${_kernel_pythonpath} && $PYTHONPATH != ${_kernel_pythonpath}:* && $PYTHONPATH != *:${_kernel_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_kernel_pythonpath}
    else
	export PYTHONPATH=${_kernel_pythonpath}:$PYTHONPATH
    fi
fi
