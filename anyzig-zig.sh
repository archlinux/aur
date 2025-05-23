#!/bin/sh
exec env ${ANYZIG_HOME:+HOME="$ANYZIG_HOME"} anyzig @VERSION@ "$@"
