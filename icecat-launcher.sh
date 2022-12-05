#!/bin/bash
  
  [ "${ICECATDIR}" == "" ] && export ICECATDIR="/usr/lib/icecat"
  export LD_LIBRARY_PATH=${ICECATDIR}:${LD_LIBRARY_PATH}
  export MOZILLA_FIVE_HOME=${ICECATDIR}
  export MOZ_PLUGIN_PATH=${ICECATDIR}/plugins/
  export MOZ_DISABLE_GNOME=1
  [ "${GNOME_DESKTOP_SESSION_ID}" != "" ] && export MOZ_DISABLE_GNOME=0
  export PREVIOUSPATH=${PATH}
  export PATH=${ICECATDIR}:${PATH}
  cd ${ICECATDIR}
  ${ICECATDIR}/icecat $@
