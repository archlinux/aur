# module var
export HEXABLOCK_ROOT_DIR=/opt/salome

# local vars
_pythonver=2.7
_hexablock_path=$HEXABLOCK_ROOT_DIR/bin/salome
_hexablock_librarypath=$HEXABLOCK_ROOT_DIR/lib/salome
_hexablock_pythonpath=$HEXABLOCK_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_paraviewver=4.2
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_hexablock_pythonpath}* ]]; then
  export PYTHONPATH=${_hexablock_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_hexablock_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_hexablock_librarypath}:$LD_LIBRARY_PATH
fi

# PATH
if [[ $PATH != *${_hexablock_path}* ]]; then
  export PATH=${_hexablock_path}:$PATH
fi
