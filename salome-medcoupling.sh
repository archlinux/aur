# module var
export MEDCOUPLING_ROOT_DIR=/opt/salome

# vars
_medcoupling_pythonver=2.7
_medcoupling_path=$MEDCOUPLING_ROOT_DIR/bin
_medcoupling_pythonpath=$MEDCOUPLING_ROOT_DIR/lib/python${_medcoupling_pythonver}/site-packages
_medcoupling_librarypath=$MEDCOUPLING_ROOT_DIR/lib

# PATH
if [[ $PATH != ${_medcoupling_path} && $PATH != ${_medcoupling_path}:* && $PATH != *:${_medcoupling_path} && $PATH != *:${_medcoupling_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PATH=${_medcoupling_path}
    else
	export PATH=${_medcoupling_path}:$PATH
    fi
fi

# PYTHONPATH
if [[ $PYTHONPATH != ${_medcoupling_pythonpath} && $PYTHONPATH != ${_medcoupling_pythonpath}:* && $PYTHONPATH != *:${_medcoupling_pythonpath} && $PYTHONPATH != *:${_medcoupling_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_medcoupling_pythonpath}
    else
	export PYTHONPATH=${_medcoupling_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_medcoupling_path} && $PYTHONPATH != ${_medcoupling_path}:* && $PYTHONPATH != *:${_medcoupling_path} && $PYTHONPATH != *:${_medcoupling_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PYTHONPATH=${_medcoupling_path}
    else
	export PYTHONPATH=${_medcoupling_path}:$PATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_medcoupling_librarypath} && $LD_LIBRARY_PATH != ${_medcoupling_librarypath}:* && $LD_LIBRARY_PATH != *:${_medcoupling_librarypath} && $LD_LIBRARY_PATH != *:${_medcoupling_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_medcoupling_librarypath}
    else
	export LD_LIBRARY_PATH=${_medcoupling_librarypath}:$LD_LIBRARY_PATH
    fi
fi
