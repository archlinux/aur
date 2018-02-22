# set needed variables
set -gx DEVKITPRO /opt/devkitpro
set -gx DEVKITA64 $DEVKITPRO/devkitA64

# add to path
set -gx PATH $PATH $DEVKITA64/bin
