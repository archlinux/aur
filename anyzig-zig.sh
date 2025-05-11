#!/bin/sh
exec env HOME="${ANYZIG_HOME}" anyzig @VERSION@ "$@"
