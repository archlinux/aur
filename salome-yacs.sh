# module var
export YACS_ROOT_DIR=/opt/salome

# local var
_yacs_pythonver=2.7
_yacs_paraviewver=5.0
_yacs_path=$YACS_ROOT_DIR/bin/salome
_yacs_librarypath=$YACS_ROOT_DIR/lib/salome
_yacs_pythonpath=$YACS_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_yacs_paraview_pythonpath="/usr/lib/paraview-${_yacs_paraviewver}/site-packages:/usr/lib/paraview-${_yacs_paraviewver}/site-packages/vtk"
_yacs_paraview_librarypath="/usr/lib/paraview-${_yacs_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_yacs_pythonpath} && $PYTHONPATH != *:${_yacs_pythonpath}&& $PYTHONPATH != ${_yacs_pythonpath}:* && $PYTHONPATH != *:${_yacs_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_yacs_pythonpath}
    else
	export PYTHONPATH=${_yacs_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_yacs_paraview_pythonpath} && $PYTHONPATH != *:${_yacs_paraview_pythonpath} && $PYTHONPATH != ${_yacs_paraview_pythonpath}:* && $PYTHONPATH != *:${_yacs_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_yacs_paraview_pythonpath}
    else
	export PYTHONPATH=${_yacs_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_yacs_librarypath} && $LD_LIBRARY_PATH != *:${_yacs_librarypath} && $LD_LIBRARY_PATH != ${_yacs_librarypath}:* && $LD_LIBRARY_PATH != *:${_yacs_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_yacs_librarypath}
    else
	export LD_LIBRARY_PATH=${_yacs_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_yacs_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_yacs_paraview_librarypath} && $LD_LIBRARY_PATH != ${_yacs_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_yacs_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_yacs_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_yacs_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_yacs_path} && $PATH != *:${_yacs_path} && $PATH != ${_yacs_path}:* && $PATH != *:${_yacs_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_yacs_path}
    else
	export PATH=${_yacs_path}:$PATH
    fi
fi
