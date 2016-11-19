# set needed variables
set -gx DEVKITPRO /opt/devkitpro
set -gx DEVKITPPC $DEVKITPRO/devkitPPC

# add to path
set -gx PATH $PATH $DEVKITPPC/bin
