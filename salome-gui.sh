# module var
export GUI_ROOT_DIR=/opt/salome

# vars
_gui_pythonver=2.7
_gui_paraviewver=5.1
_gui_path=$GUI_ROOT_DIR/bin/salome
_gui_librarypath=$GUI_ROOT_DIR/lib/salome
_gui_pythonpath=$GUI_ROOT_DIR/lib/python${_gui_pythonver}/site-packages/salome
_gui_pluginpath=$GUI_ROOT_DIR/lib/paraview
_gui_paraview_pythonpath="/usr/lib/paraview-${_gui_paraviewver}/site-packages:/usr/lib/paraview-${_gui_paraviewver}/site-packages/vtk"
_gui_paraview_librarypath="/usr/lib/paraview-${_gui_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_gui_pythonpath} && $PYTHONPATH != *:${_gui_pythonpath}&& $PYTHONPATH != ${_gui_pythonpath}:* && $PYTHONPATH != *:${_gui_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_gui_pythonpath}
    else
	export PYTHONPATH=${_gui_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_gui_paraview_pythonpath} && $PYTHONPATH != *:${_gui_paraview_pythonpath} && $PYTHONPATH != ${_gui_paraview_pythonpath}:* && $PYTHONPATH != *:${_gui_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_gui_paraview_pythonpath}
    else
	export PYTHONPATH=${_gui_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_gui_librarypath} && $LD_LIBRARY_PATH != *:${_gui_librarypath} && $LD_LIBRARY_PATH != ${_gui_librarypath}:* && $LD_LIBRARY_PATH != *:${_gui_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_gui_librarypath}
    else
	export LD_LIBRARY_PATH=${_gui_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_gui_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_gui_paraview_librarypath} && $LD_LIBRARY_PATH != ${_gui_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_gui_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_gui_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_gui_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PV_PLUGIN_PATH
if [[ $PV_PLUGIN_PATH != ${_gui_pluginpath} && $PV_PLUGIN_PATH != *:${_gui_pluginpath} && $PV_PLUGIN_PATH != ${_gui_pluginpath}:* && $PV_PLUGIN_PATH != *:${_gui_pluginpath}:* ]]; then
    if [ -z "$PV_PLUGIN_PATH" ]; then
	export PV_PLUGIN_PATH=${_gui_pluginpath}
    else
        export PV_PLUGIN_PATH=${_gui_pluginpath}:$PV_PLUGIN_PATH
    fi
fi

# PATH
if [[ $PATH != ${_gui_path} && $PATH != *:${_gui_path} && $PATH != ${_gui_path}:* && $PATH != *:${_gui_path}:* ]]; then
    if [ -z "$PATH" ]; then
	export PATH=${_gui_path}
    else
	export PATH=${_gui_path}:$PATH
    fi
fi
