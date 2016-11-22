# module var
export GUI_ROOT_DIR=/opt/salome

# local vars
_pythonver=2.7
_paraviewver=5.0
_gui_path=$GUI_ROOT_DIR/bin/salome
_gui_librarypath=$GUI_ROOT_DIR/lib/salome
_gui_pythonpath=$GUI_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_gui_pluginpath=$GUI_ROOT_DIR/lib/paraview
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_gui_pythonpath}* ]]; then
  export PYTHONPATH=${_gui_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_gui_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_gui_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi

# PV_PLUGIN_PATH
if [[ $PV_PLUGIN_PATH != *${_gui_pluginpath}* ]]; then
  export PV_PLUGIN_PATH=${_gui_pluginpath}:$PV_PLUGIN_PATH
fi

# PATH
if [[ $PATH != *${_gui_path}* ]]; then
  export PATH=${_gui_path}:$PATH
fi
