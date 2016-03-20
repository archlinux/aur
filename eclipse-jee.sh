#!/bin/bash
export ECLIPSE_HOME=/usr/lib/eclipse-jee
export GDK_NATIVE_WINDOWS=true
${ECLIPSE_HOME}/eclipse "$@"
