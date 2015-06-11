#!/bin/bash
export ECLIPSE_HOME=/usr/share/eclipse
export GDK_NATIVE_WINDOWS=true
exec ${ECLIPSE_HOME}/eclipse "$@"
