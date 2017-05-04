#!/bin/sh
 
cd ${0%${0##*/}}. 
 
PONOMAR_DIR=${PONOMAR_DIR}
CLASSPATH=${PONOMAR_DIR}:${PONOMAR_DIR}/Ponomar/*

java -Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -cp ${CLASSPATH} Ponomar.Main&

