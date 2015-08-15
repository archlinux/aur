#!/bin/sh

set -e
java $JAVA_OPTS -cp '/usr/share/java/latexdraw/*' net.sf.latexdraw.LaTeXDraw $*
