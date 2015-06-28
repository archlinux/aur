export KERNEL_ROOT_DIR=/opt/salome/kernel

export PYTHONPATH=$KERNEL_ROOT_DIR/lib/python2.7/site-packages/salome:$PYTHONPATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$KERNEL_ROOT_DIR/lib/salome

export PATH=$PATH:$KERNEL_ROOT_DIR/bin/salome
