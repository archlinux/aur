#!/bin/sh
pydir=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server \
    python2 "$pydir/cellprofiler/CellProfiler.py" --do-not-build --do-not-fetch

