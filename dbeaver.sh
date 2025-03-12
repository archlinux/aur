#!/bin/bash

export PATH="/usr/lib/jvm/java-21-openjdk/bin:${PATH}"
exec /opt/dbeaver-le/dbeaver "$@"
