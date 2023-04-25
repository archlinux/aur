#!/bin/bash

(
    for VARIABLE in \
        JAVA_HOME \
        JAVA \
        JAVAC \
        JAVAH \
        JAR \
        JAVA_LIBS \
        JAVA_CPPFLAGS \
        JAVA_LD_LIBRARY_PATH
    do
        echo export ${VARIABLE}=\"${!VARIABLE}\"
    done
) >r-javaconf.env
