#!/bin/sh

set -e
set +e

if [ -f /usr/share/office2021/mime/unregister_smoffice2021 ] ; then
	sh /usr/share/office2021/mime/unregister_smoffice2021
	rm -f /usr/share/office2021/mime/unregister_smoffice2021
fi

TMPCMD=`which update-mime-database 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ] ; then	
	update-mime-database /usr/share/mime >/dev/null 2>&1
fi
TMPCMD=`which update-desktop-database 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ] ; then
	update-desktop-database /usr/share/applications  >/dev/null 2>&1
	update-desktop-database /usr/share/mimelnk/application  >/dev/null 2>&1
fi

TMPCMD=`which gtk-update-icon-cache 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ] ; then
	touch --no-create /usr/share/icons/hicolor
	gtk-update-icon-cache --ignore-theme-index /usr/share/icons/hicolor >/dev/null 2>&1
fi

