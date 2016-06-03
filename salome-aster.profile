export ASTER_ROOT_DIR=/opt/salome
export ASTER_ROOT=/usr

_aster_pythonpath=$ASTER_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
if [[ $PYTHONPATH != *${_aster_pythonpath}* ]]; then
  export PYTHONPATH=${_aster_pythonpath}:$PYTHONPATH
fi

_pyutils_pythonpath=$ASTER_ROOT_DIR/lib/python${_pythonver}/site-packages
export PYTHONPATH=${_pyutils_pythonpath}:$PYTHONPATH
