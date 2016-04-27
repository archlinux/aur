#!/bin/sh
if [ -z "$LD_LIBRARY_PATH" ] ; then
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib/adchpp"
else
  export LD_LIBRARY_PATH="/usr/lib/adchpp"
fi
exec /usr/lib/adchpp/adchpp -p /run/adchpp/adchpp.pid "$@"
