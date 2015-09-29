# module var
export PARAVIS_ROOT_DIR=/opt/salome/paravis

# local vars
_pythonver=2.7
_paraviewver=4.2
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi
export PYTHONPATH=$PYTHONPATH:$PARAVIS_ROOT_DIR/lib/python${_pythonver}/site-packages

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PARAVIS_ROOT_DIR/lib/salome

# bin
export PATH=$PARAVIS_ROOT_DIR/bin/salome:$PATH