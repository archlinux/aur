# module var
export KERNEL_ROOT_DIR=/opt/salome

# local vars
_pythonver=2.7
_kernel_path=$KERNEL_ROOT_DIR/bin/salome
_kernel_pythonpath=$KERNEL_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_kernel_librarypath=$KERNEL_ROOT_DIR/lib/salome

# PYTHONPATH
if [[ $PYTHONPATH != *${_kernel_pythonpath}* ]]; then
  export PYTHONPATH=${_kernel_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_kernel_path}* ]]; then
  export PYTHONPATH=${_kernel_path}:$PYTHONPATH
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != *${_kernel_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_kernel_librarypath}:$LD_LIBRARY_PATH
fi

# PATH
if [[ $PATH != *${_kernel_path}* ]]; then
  export PATH=${_kernel_path}:$PATH
fi
