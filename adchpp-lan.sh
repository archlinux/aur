#!/bin/sh
if [ -z "$LD_LIBRARY_PATH" ] ; then
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib/adchpp-lan"
else
  export LD_LIBRARY_PATH="/usr/lib/adchpp-lan"
fi
exec /usr/lib/adchpp-lan/adchpp -p /run/adchpp-lan/adchpp-lan.pid "$@"
