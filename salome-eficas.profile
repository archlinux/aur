export EFICAS_ROOT_DIR=/opt/salome
export EFICAS_ROOT=/opt/eficas/public/eficas-2015.2/

_pythonver=2.7
_eficas_path=$EFICAS_ROOT_DIR/bin/salome
_eficas_pythonpath=$EFICAS_ROOT_DIR/lib/python${_pythonver}/site-packages/salome
_eficas_util_pythonpath=$EFICAS_ROOT:$EFICAS_ROOT/UiQT4:$EFICAS_ROOT/Editeur

# PYTHONPATH
if [[ $PYTHONPATH != *${_eficas_pythonpath}* ]]; then
  export PYTHONPATH=${_eficas_pythonpath}:$PYTHONPATH
fi
if [[ $PYTHONPATH != *${_eficas_util_pythonpath}* ]]; then
  export PYTHONPATH=${_eficas_util_pythonpath}:$PYTHONPATH
fi

# PATH
if [[ $PATH != *${_eficas_path}* ]]; then
  export PATH=${_eficas_path}:$PATH
fi
