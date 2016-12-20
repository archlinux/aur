# module var
export PARAVIS_ROOT_DIR=/opt/salome

# local vars
_paravis_pythonver=2.7
_paravis_paraviewver=5.0
_paravis_path=$PARAVIS_ROOT_DIR/bin/salome
_paravis_librarypath=$PARAVIS_ROOT_DIR/lib/salome
_paravis_pluginpath=$PARAVIS_ROOT_DIR/lib/paraview
_paravis_pythonpath=$PARAVIS_ROOT_DIR/lib/python${_paravis_pythonver}/site-packages/salome
_paravis_paraview_pythonpath="/usr/lib/paraview-${_paravis_paraviewver}/site-packages/:/usr/lib/paraview-${_paravis_paraviewver}/site-packages/vtk"
_paravis_paraview_librarypath="/usr/lib/paraview-${_paravis_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_paravis_pythonpath} && $PYTHONPATH != *:${_paravis_pythonpath} && $PYTHONPATH != ${_paravis_pythonpath}:* && $PYTHONPATH != *:${_paravis_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_paravis_pythonpath}
    else
	export PYTHONPATH=${_paravis_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_paravis_paraview_pythonpath} && $PYTHONPATH != *:${_paravis_paraview_pythonpath} && $PYTHONPATH != ${_paravis_paraview_pythonpath}:* && $PYTHONPATH != *:${_paravis_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_paravis_paraview_pythonpath}
    else
	export PYTHONPATH=${_paravis_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_paravis_librarypath} && $LD_LIBRARY_PATH != *:${_paravis_librarypath} && $LD_LIBRARY_PATH != ${_paravis_librarypath}:* && $LD_LIBRARY_PATH != *:${_paravis_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_paravis_librarypath}
    else
	export LD_LIBRARY_PATH=${_paravis_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_paravis_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_paravis_paraview_librarypath} && $LD_LIBRARY_PATH != ${_paravis_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_paravis_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_paravis_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_paravis_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PV_PLUGIN_PATH
if [[ $PV_PLUGIN_PATH != ${_paravis_pluginpath} && $PV_PLUGIN_PATH != *:${_paravis_pluginpath} && $PV_PLUGIN_PATH != ${_paravis_pluginpath}:* && $PV_PLUGIN_PATH != *:${_paravis_pluginpath}:* ]]; then
    if [[ -z "$PV_PLUGIN_PATH" ]]; then
	export PV_PLUGIN_PATH=${_paravis_pluginpath}
    else
	export PV_PLUGIN_PATH=${_paravis_pluginpath}:$PV_PLUGIN_PATH
    fi
fi

# PATH
if [[ $PATH != ${_paravis_path} && $PATH != *:${_paravis_path} && $PATH != ${_paravis_path}:* && $PATH != *:${_paravis_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PATH=${_paravis_path}
    else
	export PATH=${_paravis_path}:$PATH
    fi
fi
