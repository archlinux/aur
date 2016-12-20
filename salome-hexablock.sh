# module var
export HEXABLOCK_ROOT_DIR=/opt/salome

# local vars
_hexablock_pythonver=2.7
_hexablock_paraviewver=5.0
_hexablock_path=$HEXABLOCK_ROOT_DIR/bin/salome
_hexablock_librarypath=$HEXABLOCK_ROOT_DIR/lib/salome
_hexablock_pythonpath=$HEXABLOCK_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_hexablock_paraview_pythonpath="/usr/lib/paraview-${_hexablock_paraviewver}/site-packages:/usr/lib/paraview-${_hexablock_paraviewver}/site-packages/vtk"
_hexablock_paraview_librarypath="/usr/lib/paraview-${_hexablock_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_hexablock_pythonpath} && $PYTHONPATH != *:${_hexablock_pythonpath}&& $PYTHONPATH != ${_hexablock_pythonpath}:* && $PYTHONPATH != *:${_hexablock_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_hexablock_pythonpath}
    else
	export PYTHONPATH=${_hexablock_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_hexablock_paraview_pythonpath} && $PYTHONPATH != *:${_hexablock_paraview_pythonpath} && $PYTHONPATH != ${_hexablock_paraview_pythonpath}:* && $PYTHONPATH != *:${_hexablock_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_hexablock_paraview_pythonpath}
    else
	export PYTHONPATH=${_hexablock_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_hexablock_librarypath} && $LD_LIBRARY_PATH != *:${_hexablock_librarypath} && $LD_LIBRARY_PATH != ${_hexablock_librarypath}:* && $LD_LIBRARY_PATH != *:${_hexablock_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_hexablock_librarypath}
    else
	export LD_LIBRARY_PATH=${_hexablock_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_hexablock_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_hexablock_paraview_librarypath} && $LD_LIBRARY_PATH != ${_hexablock_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_hexablock_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_hexablock_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_hexablock_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_hexablock_path} && $PATH != *:${_hexablock_path} && $PATH != ${_hexablock_path}:* && $PATH != *:${_hexablock_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_hexablock_path}
    else
	export PATH=${_hexablock_path}:$PATH
    fi
fi
