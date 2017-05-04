#!/bin/sh
 
cd ${0%${0##*/}}. 
 
PONOMAR_DIR=${PONOMAR_DIR}
CLASSPATH=${PONOMAR_DIR}:${PONOMAR_DIR}/Ponomar/*

# update
#if [ -d ${BGBILLING_DIR}/lib.update ];
#then
#    mv -f ${BGBILLING_DIR}/lib.update/* ${BGBILLING_DIR}/lib
#    rm -fr ${BGBILLING_DIR}/lib.update
#fi

#java -Dupdate.folder=${BGBILLING_DIR}/lib.update -Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -Djava.net.preferIPv4Stack=true -Dsun.net.client.defaultConnectTimeout=1000 -Djavax.net.ssl.trustStore=.keystore -Xmx512m  -Duser.language=ru -Duser.region=RU -cp ${CLASSPATH} ru.bitel.bgbilling.client.BGClient&

java -Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -cp ${CLASSPATH} Ponomar.Main&

