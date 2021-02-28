#!/bin/sh
 
PONOMAR_DIR=/opt/ponomar
CLASSPATH=${PONOMAR_DIR}:${PONOMAR_DIR}/Ponomar/*

cd ${PONOMAR_DIR}

java -Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -cp ${CLASSPATH} Ponomar.Main&

