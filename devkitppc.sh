
# allow per-user override
if [ -z $DEVKITPRO ]; then
  export DEVKITPRO=/opt/devkitpro
fi
export DEVKITPPC=$DEVKITPRO/devkitPPC

# add to paths
export PATH=$PATH:$DEVKITPPC/bin
export MANPATH=$MANPATH:$DEVKITPPC/man
