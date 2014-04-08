
# allow per-user override
if [ -z $DEVKITPRO ]; then
  export DEVKITPRO=/opt/devkitpro
fi
export DEVKITARM=$DEVKITPRO/devkitARM

# add to paths
export PATH=$PATH:$DEVKITARM/bin
export MANPATH=$MANPATH:$DEVKITARM/man
