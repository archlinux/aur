# module var
export GEOM_ROOT_DIR=/opt/salome

# local vars
_pythonver=2.7
_paraviewver=4.2
_geom_path=$MED_ROOT_DIR/bin/salome
_geom_librarypath=$MED_ROOT_DIR/lib/salome
_geom_pythonpath=$MED_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_geom_pythonpath}* ]]; then
  export PYTHONPATH=${_geom_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_geom_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_geom_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi

# PATH
if [[ $PATH != *${_geom_path}* ]]; then
  export PATH=${_geom_path}:$PATH
fi
