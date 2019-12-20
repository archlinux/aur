export PATH=$PATH:_inteldir/quartus/bin:_inteldir/quartus/sopc_builder/bin
export QUARTUS_ROOTDIR=_inteldir/quartus/

# Detect if a 64bit machine and activate quartus
# depending on it.
if [ `uname -m` = "x86_64" ] ; then
  QUARTUS_64BIT='1'
else
  QUARTUS_64BIT='0'
fi
export QUARTUS_64BIT
