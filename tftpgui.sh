#!/bin/sh

_pymin=`/usr/bin/python3 --version | cut -d " " -f 2 | sed 's@\..$@@'`

if [ ! -d ~/.tftpgui ]
then
  install -vdm755 ~/.tftpgui/{logs,tftproot}
  sed "s@~@$HOME@" /etc/tftpgui.cfg >  ~/.tftpgui.cfg
  chmod 644 ~/.tftpgui.cfg 
fi

/usr/bin/authbind /usr/bin/python3 /usr/lib/python${_pymin}/site-packages/tftpgui/tftpgui.py
