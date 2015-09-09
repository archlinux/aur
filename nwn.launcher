#!/bin/sh

# Create user directory if it doesn't exist
if [ ! -d "$HOME/.nwn/" ]; then
    mkdir $HOME/.nwn/
fi

cd "/opt/nwn"

# Uncomment to make SDL Sound work on Software Mixers
#export SDL_AUDIODRIVER=esd
export SDL_MOUSE_RELATIVE=0
export SDL_VIDEO_X11_DGAMOUSE=0

# Hardware Mouse Cursor
export XCURSOR_PATH=/opt/nwn
export XCURSOR_THEME=nwmouse

# Enable AA on NVidia cards (/usr/share/doc/NVIDIA_GLX-1.0/README.txt)
# 3 = 1.5 x 1.5 super sampling
# 4 = 2x2 super sampling
export __GL_FSAA_MODE=4

# Add Miles Sound Codec to Library Path
export LD_LIBRARY_PATH=./miles:$LD_LIBRARY_PATH

# Per-User Settings Support, Hardware Mouse Cursor Support, Linux Movies Support, Client Side Chat Logging Support
export LD_PRELOAD=./nwuser.so:./nwuser64.so:./nwmouse.so:./nwmovies.so:./nwlogger.so

# Run Neverwinter Nights
./nwmain $*

exit $?

