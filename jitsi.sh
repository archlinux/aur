#!/bin/bash

CLIENTARGS=""
uname -m | grep i686 && CLIENTARGS="-client -Xmx256m"

if [[ -n ${JAVA_HOME} ]]; then
  JAVABIN="${JAVA_HOME}/bin/java"
else
  JAVABIN="java"
fi

if ! ${JAVABIN} -version 2>&1 | grep version | grep -q 1.8; then
  if command -v zenity > /dev/null; then
    zenity --error --no-wrap --text="Your java version is $(archlinux-java get) but you need Java JRE/JDK 1.8\nPlease install Java 1.8 or set your PATH to the right binary\nMore info: https://wiki.archlinux.org/index.php/Java"
  elif command -v kdialog > /dev/null; then
    kdialog --sorry "Your java version is $(archlinux-java get) but you need Java JRE/JDK 1.8\nPlease install Java 1.8 or set your PATH to the right binary\nMore info: https://wiki.archlinux.org/index.php/Java" --title="Invalid Java version"
  elif command -v xmessage > /dev/null; then
    xmessage -center "$(echo -e "Your java version is $(archlinux-java get) but you need Java JRE/JDK 1.8\nPlease install Java 1.8 or set your PATH to the right binary\nMore info: https://wiki.archlinux.org/index.php/Java")"
  else
    echo -e "Your java version is $(archlinux-java get) but you need Java JRE/JDK 1.8\nPlease install Java 1.8 or set your PATH to the right binary\nMore info: https://wiki.archlinux.org/index.php/Java"
  fi
  exit 1
fi

SCDIR=/usr/lib/jitsi
LIBPATH="${SCDIR}/lib"
CLASSPATH="${LIBPATH}/felix.jar:${SCDIR}/sc-bundles/sc-launcher.jar:${SCDIR}/sc-bundles/util.jar:${SCDIR}/sc-bundles/dnsjava.jar:${LIBPATH}"
FELIX_CONFIG="${LIBPATH}/felix.client.run.properties"
LOG_CONFIG="${LIBPATH}/logging.properties"
COMMAND="${JAVABIN} ${CLIENTARGS} -classpath ${CLASSPATH} -Djna.library.path=${LIBPATH}/native -Dfelix.config.properties=file:${FELIX_CONFIG} -Djava.util.logging.config.file=${LOG_CONFIG} net.java.sip.communicator.launcher.SIPCommunicator"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${LIBPATH}/native"

cd "${SCDIR}"

exec ${COMMAND} $*
