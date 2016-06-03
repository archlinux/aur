# module var
export YACS_ROOT_DIR=/opt/salome

# local var
_pythonver=2.7
_paraviewver=4.2
_yacs_path=$YACS_ROOT_DIR/bin/salome
_yacs_librarypath=$YACS_ROOT_DIR/lib/salome
_yacs_pythonpath=$YACS_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_paraview_pythonpath="/usr/lib/paraview-${_paraviewver}/site-packages/:/usr/lib/paraview-${_paraviewver}/site-packages/vtk"
_paraview_librarypath="/usr/lib/paraview-${_pkgver}"

# PYTHONPATH
if [[ $PYTHONPATH != *${_yacs_pythonpath}* ]]; then
  export PYTHONPATH=${_yacs_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_yacs_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_yacs_librarypath}:$LD_LIBRARY_PATH
fi
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi

# PATH
if [[ $PATH != *${_yacs_path}* ]]; then
  export PATH=${_yacs_path}:$PATH
fi
