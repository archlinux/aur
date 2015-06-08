#!/bin/bash
source /etc/profile.d/wildfly.sh
source /etc/profile.d/jre.sh

if [ "$JBOSS_MODE" = "standalone" ]; then
  JBOSS_CONFIGS="-c $JBOSS_CONFIG"
else
  JBOSS_CONFIGS="--domain-config=$JBOSS_DOMAIN_CONFIG --host-config=$JBOSS_HOST_CONFIG"
fi

export LAUNCH_IN_BACKGROUND=1
exec $JBOSS_HOME/bin/$JBOSS_MODE.sh $JBOSS_CONFIGS "$@" >> $JBOSS_CONSOLE_LOG 2>&1 
