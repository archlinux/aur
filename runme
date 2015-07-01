#!/bin/sh
mkdir -p ~/.wolf3d
for file in /opt/wolfenstein3d/*; do ln -s $file ~/.wolf3d/`basename $file`; done
dosbox -conf ~/.wolf3d/dosbox.conf
