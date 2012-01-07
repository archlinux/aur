#!/bin/sh
if [ ! -f $GRAILS_HOME/startGrails ]; then
  GRAILS_HOME=/usr/share/grails
fi
DIRNAME=$GRAILS_HOME
. "$DIRNAME/startGrails"
startGrails org.codehaus.groovy.grails.cli.GrailsScriptRunner "$@"
