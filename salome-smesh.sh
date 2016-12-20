# module var
export SMESH_ROOT_DIR=/opt/salome

# local vars
_smesh_pythonver=2.7
_smesh_paraviewver=5.0
_smesh_path=$SMESH_ROOT_DIR/bin/salome
_smesh_librarypath=$SMESH_ROOT_DIR/lib/salome
_smesh_pythonpath=$SMESH_ROOT_DIR/lib/python${_smesh_pythonver}/site-packages/salome
_smesh_paraview_pythonpath="/usr/lib/paraview-${_smesh_paraviewver}/site-packages/:/usr/lib/paraview-${_smesh_paraviewver}/site-packages/vtk"
_smesh_paraview_librarypath="/usr/lib/paraview-${_smesh_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_smesh_pythonpath} && $PYTHONPATH != *:${_smesh_pythonpath}&& $PYTHONPATH != ${_smesh_pythonpath}:* && $PYTHONPATH != *:${_smesh_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_smesh_pythonpath}
    else
	export PYTHONPATH=${_smesh_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_smesh_paraview_pythonpath} && $PYTHONPATH != *:${_smesh_paraview_pythonpath} && $PYTHONPATH != ${_smesh_paraview_pythonpath}:* && $PYTHONPATH != *:${_smesh_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_smesh_paraview_pythonpath}
    else
	export PYTHONPATH=${_smesh_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_smesh_librarypath} && $LD_LIBRARY_PATH != *:${_smesh_librarypath} && $LD_LIBRARY_PATH != ${_smesh_librarypath}:* && $LD_LIBRARY_PATH != *:${_smesh_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_smesh_librarypath}
    else
	export LD_LIBRARY_PATH=${_smesh_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_smesh_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_smesh_paraview_librarypath} && $LD_LIBRARY_PATH != ${_smesh_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_smesh_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_smesh_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_smesh_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_smesh_path} && $PATH != *:${_smesh_path} && $PATH != ${_smesh_path}:* && $PATH != *:${_smesh_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_smesh_path}
    else
	export PATH=${_smesh_path}:$PATH
    fi
fi
