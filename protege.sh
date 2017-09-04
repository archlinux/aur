#!/bin/sh

cd /usr/share/java/protege

CMD_OPTIONS="-Dapple.laf.useScreenMenuBar=true -Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.xrender=true" sh run.sh "$@"
