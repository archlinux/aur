#!/bin/sh
[[ -f $GRAILS_HOME/startGrails ]] || GRAILS_HOME=/usr/share/grails
DIRNAME=$GRAILS_HOME
. "$DIRNAME/startGrails"
startGrails org.codehaus.groovy.grails.cli.GrailsScriptRunner "$@"
