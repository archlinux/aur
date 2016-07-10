#!/bin/bash
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--server)
    SERVER="$2"
    shift # past argument
    ;;
esac
shift # past argument or value
done
if [ -z "${SERVER}" ]; then
  SERVER="Cities1"
fi
echo SERVER  = "${SERVER}"
javaws  /opt/xplorers/xplorers${SERVER}.jnlp
