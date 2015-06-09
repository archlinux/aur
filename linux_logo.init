#!/bin/bash
#
# linux_logo: Hook to allow linux_logo to update issue
#
# description: Linux_logo puts up a greeting screen.

case "${1}" in
  start)
    /usr/bin/linux_logo -f -L 1 | sed 's/\\/\\\\/g' >/etc/issue
    echo "( \l )" >>/etc/issue
    ;;
  stop)
    _description=`lsb_release -sd|sed 's/"//g'`
    _release=`lsb_release -sr`
    echo "${_description} (${_release}) \r  (\n) (\l)" >/etc/issue
    ;;
  *)
    echo "Usage: ${0} {start|stop}"
esac

exit 0
