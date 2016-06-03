# module var
export PARAVIS_ROOT_DIR=/opt/salome

# local vars
_pythonver=2.7
_paraviewver=4.2
_paravis_path=$PARAVIS_ROOT_DIR/bin/salome
_paravis_librarypath=$PARAVIS_ROOT_DIR/lib/salome
_paravis_pluginpath=$PARAVIS_ROOT_DIR/lib/paraview
_paravis_pythonpath=$PARAVIS_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_paravis_pythonpath}* ]]; then
  export PYTHONPATH=${_paravis_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_paravis_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paravis_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi

# PV_PLUGIN_PATH
if [[ $PV_PLUGIN_PATH != *${_paravis_pluginpath}* ]]; then
  export PV_PLUGIN_PATH=${_paravis_pluginpath}:$PV_PLUGIN_PATH
fi

# PATH
if [[ $PATH != *${_paravis_path}* ]]; then
  export PATH=${_paravis_path}:$PATH
fi
