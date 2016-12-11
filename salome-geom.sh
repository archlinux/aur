# module var
export GEOM_ROOT_DIR=/opt/salome

# vars
_geom_pythonver=2.7
_geom_paraviewver=5.0
_geom_path=$MED_ROOT_DIR/bin/salome
_geom_librarypath=$MED_ROOT_DIR/lib/salome
_geom_pythonpath=$MED_ROOT_DIR/lib/python${_geom_pythonver}/site-packages/salome
_geom_paraview_pythonpath="/usr/lib/paraview-${_geom_paraviewver}/site-packages/:/usr/lib/paraview-${_geom_paraviewver}/site-packages/vtk"
_geom_paraview_librarypath="/usr/lib/paraview-${_geom_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_geom_pythonpath} && $PYTHONPATH != *:${_geom_pythonpath} && $PYTHONPATH != ${_geom_pythonpath}:* && $PYTHONPATH != *:${_geom_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_geom_pythonpath}
    else
	export PYTHONPATH=${_geom_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_geom_paraview_pythonpath} && $PYTHONPATH != *:${_geom_paraview_pythonpath} && $PYTHONPATH != ${_geom_paraview_pythonpath}:* && $PYTHONPATH != *:${_geom_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_geom_paraview_pythonpath}
    else
	export PYTHONPATH=${_geom_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_geom_librarypath} && $LD_LIBRARY_PATH != *:${_geom_librarypath} && $LD_LIBRARY_PATH != ${_geom_librarypath}:* && $LD_LIBRARY_PATH != *:${_geom_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_geom_librarypath}
    else
	export LD_LIBRARY_PATH=${_geom_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_geom_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_geom_paraview_librarypath} && $LD_LIBRARY_PATH != ${_geom_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_geom_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_geom_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_geom_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_geom_path} && $PATH != *:${_geom_path} && $PATH != ${_geom_path}:* && $PATH != *:${_geom_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PATH=${_geom_path}
    else
	export PATH=${_geom_path}:$PATH
    fi
fi
