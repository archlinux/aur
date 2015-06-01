#!/bin/bash
SHARE="/usr/share"
JAVASHARE="${SHARE}/java"

cd $(mktemp -d --suffix=-syndie)
java -cp ${JAVASHARE}/hsqldb.jar:${JAVASHARE}/swt.jar:${SHARE}/syndie/syndie.jar:/opt/i2p/lib/i2p.jar:${SHARE}/syndie/servlet.jar -Djava.library.path=/usr/lib syndie.gui.SWTUI "$@"
