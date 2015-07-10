export GEOM_ROOT_DIR=/opt/salome/geom

_paraview_pythonpath="/usr/lib/paraview-4.3/site-packages/:/usr/lib/paraview-4.3/site-packages/vtk"
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi
export PYTHONPATH=$PYTHONPATH:$GEOM_ROOT_DIR/lib/python2.7/site-packages

_paraview_librarypath="/usr/lib/paraview-4.3"
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GEOM_ROOT_DIR/lib/salome

export PATH=$GEOM_ROOT_DIR/bin/salome:$PATH