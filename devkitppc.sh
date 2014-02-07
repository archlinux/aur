if [ -z $DEVKITPRO ]; then
  export DEVKITPRO=/opt/devkitpro
fi
export DEVKITPPC=$DEVKITPRO/devkitPPC
export PATH=$PATH:$DEVKITPPC/bin
export MANPATH=$MANPATH:$DEVKITPPC/man
