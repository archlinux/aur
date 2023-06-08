#!/bin/bash

create_desktop1()
{
	VERSION=$1
	if [ $VERSION = "free" ] ; then
		SHORTVERSION="21free"
		TMDESKTOPNAME=textmaker-$VERSION"21".desktop
		PMDESKTOPNAME=planmaker-$VERSION"21".desktop
		PRDESKTOPNAME=presentations-$VERSION"21".desktop
	else
		if [ $VERSION = "smbeta" ] ; then
			VERSION="beta"
			SHORTVERSION="21beta"
		else
			SHORTVERSION=$(($VERSION-2000))
		fi
		TMDESKTOPNAME=textmaker-$VERSION.desktop
		PMDESKTOPNAME=planmaker-$VERSION.desktop
		PRDESKTOPNAME=presentations-$VERSION.desktop
	fi

	SCRIPT=1
	if [ -z $2 ] ; then
		SCRIPT=0
	else
		if [ $2 = "0" ] ; then
			SCRIPT=0
		fi
	fi

	
	TMDESKTOP=$SRCPATH/mime/$TMDESKTOPNAME
	PMDESKTOP=$SRCPATH/mime/$PMDESKTOPNAME
	PRDESKTOP=$SRCPATH/mime/$PRDESKTOPNAME

#echo VERSION is $VERSION, SHORTVERSION is $SHORTVERSION and SRCPATH is $SRCPATH

	if [ $VERSION = "free" -o $VERSION = "beta" ] ; then
		if [ -f $SRCPATH/mime/tml21.dsk ] ; then
#			echo $SRCPATH/mime/tml21.dsk found, moving files...
			
			mv $SRCPATH/mime/tml21.dsk $TMDESKTOP
			mv $SRCPATH/mime/pml21.dsk $PMDESKTOP
			mv $SRCPATH/mime/prl21.dsk $PRDESKTOP
#		else
#			echo "VERSION is $VERSION, $SRCPATH/mime/tml21.dsk NOT found!"
		fi
	else
		if [ -f $SRCPATH/mime/tml$SHORTVERSION.dsk ] ; then
			mv $SRCPATH/mime/tml$SHORTVERSION.dsk $TMDESKTOP
			mv $SRCPATH/mime/pml$SHORTVERSION.dsk $PMDESKTOP
			mv $SRCPATH/mime/prl$SHORTVERSION.dsk $PRDESKTOP
#		else
#			echo "VERSION is $VERSION, $SRCPATH/mime/tml21.dsk NOT found!"
		fi
	fi

	if [ $SCRIPT -eq 1 ] ; then
		USRBINPATH=$APPBINPATH
		
	else
		USRBINPATH="/usr/bin"
	fi

	echo " " >> $TMDESKTOP	
	echo "Version=1.0" >> $TMDESKTOP
	if [ $VERSION = "free" ] ; then
		echo "Name=FreeOffice 2021 TextMaker" >> $TMDESKTOP
		echo "Icon=application-x-tml21free" >> $TMDESKTOP
	else
		if [ $VERSION = "beta" ] ; then
			echo "Name=TextMaker 2021 Beta" >> $TMDESKTOP
			echo "Icon=application-x-tml21beta" >> $TMDESKTOP
		else
			echo "Name=TextMaker $VERSION" >> $TMDESKTOP
			echo "Icon=application-x-tml21" >> $TMDESKTOP
		fi
	fi
	echo "TryExec=$USRBINPATH/textmaker$SHORTVERSION" >> $TMDESKTOP
        echo "StartupWMClass=tm" >> $TMDESKTOP
	echo "Exec=$USRBINPATH/textmaker$SHORTVERSION %F" >> $TMDESKTOP
	echo "Path=$APPPATH" >> $TMDESKTOP
	
	echo "Version=1.0" >> $PMDESKTOP
	if [ $VERSION = "free" ] ; then
		echo "Name=FreeOffice 2021 PlanMaker" >> $PMDESKTOP
		echo "Icon=application-x-pml21free" >> $PMDESKTOP
	else
		if [ $VERSION = "beta" ] ; then
			echo "Name=PlanMaker 2021 Beta" >> $PMDESKTOP
			echo "Icon=application-x-pml21beta" >> $PMDESKTOP
		else
			echo "Name=PlanMaker $VERSION" >> $PMDESKTOP
			echo "Icon=application-x-pml21" >> $PMDESKTOP
		fi
	fi

	echo "TryExec=$USRBINPATH/planmaker$SHORTVERSION" >> $PMDESKTOP
        echo "StartupWMClass=pm" >> $PMDESKTOP
	echo "Exec=$USRBINPATH/planmaker$SHORTVERSION %F" >> $PMDESKTOP
	echo "Path=$APPPATH" >> $PMDESKTOP
	
	echo "Version=1.0" >> $PRDESKTOP
	if [ $VERSION = "free" ] ; then
		echo "Name=FreeOffice 2021 Presentations" >> $PRDESKTOP
		echo "Icon=application-x-prl21free" >> $PRDESKTOP
	else
		if [ $VERSION = "beta" ] ; then
			echo "Name=Presentations 2021 Beta" >> $PRDESKTOP
			echo "Icon=application-x-prl21beta" >> $PRDESKTOP
		else
			echo "Name=Presentations $VERSION" >> $PRDESKTOP
			echo "Icon=application-x-prl21" >> $PRDESKTOP
		fi
	fi
	echo "TryExec=$USRBINPATH/presentations$SHORTVERSION" >> $PRDESKTOP
        echo "StartupWMClass=pr" >> $PRDESKTOP
	echo "Exec=$USRBINPATH/presentations$SHORTVERSION %F" >> $PRDESKTOP
	echo "Path=$APPPATH" >> $PRDESKTOP

#	if [ "$BUILD" = "DEB" ] ; then
#		chmod 644 $TMDESKTOP
#		chmod 644 $PMDESKTOP
#		chmod 644 $PRDESKTOP
#	else
		chmod 755 $TMDESKTOP
		chmod 755 $PMDESKTOP
		chmod 755 $PRDESKTOP
#	fi
}

create_desktop2()
{
	if [ "$1" = "free" ] ; then
		VERSION="free21"
	else
		VERSION=$1
	fi

	SCRIPT=1
	if [ -z $2 ] ; then
		SCRIPT=0
	else
		if [ $2 = "0" ] ; then
			SCRIPT=0
		fi
	fi

	display_information "Adding icons to the menu..."
	#echo "Adding icons to the menu..."

	TMDESKTOPNAME=textmaker-$VERSION.desktop
	PMDESKTOPNAME=planmaker-$VERSION.desktop
	PRDESKTOPNAME=presentations-$VERSION.desktop

	if [ "$LOCALINSTALL" = "0" ] ; then
		if [ -f /usr/share/applications/$TMDESKTOPNAME ] ; then
			rm /usr/share/applications/$TMDESKTOPNAME
		fi
		if [ -f /usr/share/applications/$PMDESKTOPNAME ] ; then
			rm /usr/share/applications/$PMDESKTOPNAME
		fi
		if [ -f /usr/share/applications/$PRDESKTOPNAME ] ; then
			rm /usr/share/applications/$PRDESKTOPNAME
		fi
	fi
	
	TMDESKTOP=$SRCPATH/mime/$TMDESKTOPNAME
	PMDESKTOP=$SRCPATH/mime/$PMDESKTOPNAME
	PRDESKTOP=$SRCPATH/mime/$PRDESKTOPNAME
	chmod 755 $TMDESKTOP
	chmod 755 $PMDESKTOP
	chmod 755 $PRDESKTOP
	
	if [ $SCRIPT -eq 1 ] ; then
		if [ "$LOCALINSTALL" = "1" ] ; then
			XDG_MODE=" user "
		else
			XDG_MODE=" system "
		fi
	else
		XDG_MODE=" system "
	fi
	
	sh $XDGPATH/xdg-desktop-menu install --noupdate --novendor --mode $XDG_MODE $TMDESKTOP >/dev/null 2>&1
	sh $XDGPATH/xdg-desktop-menu install --noupdate --novendor --mode $XDG_MODE $PMDESKTOP >/dev/null 2>&1
	sh $XDGPATH/xdg-desktop-menu install --noupdate --novendor --mode $XDG_MODE $PRDESKTOP >/dev/null 2>&1
	sh $XDGPATH/xdg-desktop-menu forceupdate --mode $XDG_MODE >/dev/null 2>&1
	
	echo "echo Removing icons from the menu..." >> $UNINSTALLSCRIPT
	echo "sh $XDGPATH/xdg-desktop-menu uninstall --noupdate --novendor --mode $XDG_MODE $TMDESKTOP" >> $UNINSTALLSCRIPT
	echo "sh $XDGPATH/xdg-desktop-menu uninstall --noupdate --novendor --mode $XDG_MODE $PMDESKTOP" >> $UNINSTALLSCRIPT
	echo "sh $XDGPATH/xdg-desktop-menu uninstall --noupdate --novendor --mode $XDG_MODE $PRDESKTOP" >> $UNINSTALLSCRIPT
	echo "sh $XDGPATH/xdg-desktop-menu forceupdate --mode $XDG_MODE" >> $UNINSTALLSCRIPT

if [ 1 -eq 0 ] ; then
	display_information "Adding icons to the desktop..."
	#echo "Adding icons to the desktop..."
	
	if [ "$LOCALINSTALL" = "0" -o $SCRIPT -eq 0 ] ; then
		for LOCALUSRNAME in `grep -v bin/nologin /etc/passwd | grep -wFf /etc/shells | cut -d: -f 1` ; do
				DesktopDir=`su $LOCALUSRNAME -c "sh $XDGPATH/xdg-user-dir DESKTOP"`
				if [ "M$DesktopDir" = "M" ] ; then
					DesktopDir="Desktop"
				fi
				if [ -d "$DesktopDir" ] ; then
					echo "Creating desktop in folder $DesktopDir" 
#					echo "Creating desktop in folder $DesktopDir"  >> /tmp/sm_tmp.txt
					DUSER=`stat $DesktopDir -c %u`
					DGROUP=`stat $DesktopDir -c %g`
					
					cp -f $TMDESKTOP $DesktopDir
					chmod 755 $DesktopDir/$TMDESKTOPNAME
					chown $DUSER:$DGROUP $DesktopDir/$TMDESKTOPNAME
					
					cp -f $PMDESKTOP $DesktopDir
					chmod 755 $DesktopDir/$PMDESKTOPNAME
					chown $DUSER:$DGROUP $DesktopDir/$PMDESKTOPNAME
					
					cp -f $PRDESKTOP $DesktopDir
					chmod 755 $DesktopDir/$PRDESKTOPNAME
					chown $DUSER:$DGROUP $DesktopDir/$PRDESKTOPNAME
					
					echo "echo Removing icons from the desktop..." >> $UNINSTALLSCRIPT
					echo "rm -f $DesktopDir/$TMDESKTOPNAME" >> $UNINSTALLSCRIPT
					echo "rm -f $DesktopDir/$PMDESKTOPNAME" >> $UNINSTALLSCRIPT
					echo "rm -f $DesktopDir/$PRDESKTOPNAME" >> $UNINSTALLSCRIPT
					 
				fi
		done
		if [ -d /usr/share/app-inst ] ; then
			cp -f $TMDESKTOP /usr/share/app-inst/desktop
			cp -f $PMDESKTOP /usr/share/app-inst/desktop
			cp -f $PRDESKTOP /usr/share/app-inst/desktop
			echo "X-AppInstall-Package=softmaker-office-$VERSION" >> /usr/share/app-inst/desktop/$TMDESKTOPNAME
			echo "X-AppInstall-Package=softmaker-office-$VERSION" >> /usr/share/app-inst/desktop/$PMDESKTOPNAME
			echo "X-AppInstall-Package=softmaker-office-$VERSION" >> /usr/share/app-inst/desktop/$PRDESKTOPNAME
		fi
	fi
	
	if [ "$LOCALINSTALL" = "1" ] ; then

		#message for kde desktops to show the icons
		echo "For the desktop icons to appear, you might have to log out and log in again."

		sh $XDGPATH/xdg-desktop-icon install --novendor  $TMDESKTOP >/dev/null 2>&1
		sh $XDGPATH/xdg-desktop-icon install --novendor  $PMDESKTOP >/dev/null 2>&1
		sh $XDGPATH/xdg-desktop-icon install --novendor  $PRDESKTOP >/dev/null 2>&1
		
		if [ $SCRIPT -eq 1 ] ; then
			echo "echo Removing icons from the desktop..." >> $UNINSTALLSCRIPT
			echo "sh $XDGPATH/xdg-desktop-icon uninstall --novendor  $TMDESKTOP" >> $UNINSTALLSCRIPT
			echo "sh $XDGPATH/xdg-desktop-icon uninstall --novendor  $PMDESKTOP" >> $UNINSTALLSCRIPT
			echo "sh $XDGPATH/xdg-desktop-icon uninstall --novendor  $PRDESKTOP" >> $UNINSTALLSCRIPT
		fi
	fi
fi

#lh 01.07.2018 rev. 965 
VERSION=$1
}

create_script()
{
	VERSION=$1
	if [ $VERSION = "free" ] ; then
		SHORTVERSION="21free"
	else
		if [ $VERSION = "beta" ] ; then
			SHORTVERSION="21beta"
		else
			SHORTVERSION=$(($VERSION-2000))
		fi
	fi
 
	SCRIPT=1
	if [ -z $2 ] ; then
		SCRIPT=0
	else
		if [ $2 = "0" ] ; then
			SCRIPT=0
		fi
	fi
	
    echo "#!/bin/sh" > "$APPBINPATH"/textmaker$SHORTVERSION
    echo "# A script to run TextMaker." >> "$APPBINPATH"/textmaker$SHORTVERSION
	echo $APPPATH/textmaker \"\$@\" >> "$APPBINPATH"/textmaker$SHORTVERSION

	echo "#!/bin/sh" > "$APPBINPATH"/planmaker$SHORTVERSION
    echo "# A script to run PlanMaker." >> "$APPBINPATH"/planmaker$SHORTVERSION
    echo $APPPATH/planmaker \"\$@\" >> "$APPBINPATH"/planmaker$SHORTVERSION

	echo "#!/bin/bash" > "$APPBINPATH"/presentations$SHORTVERSION
    echo "# A script to run Presentations." >> "$APPBINPATH"/presentations$SHORTVERSION
    cat << PRES >> "$APPBINPATH"/presentations$SHORTVERSION
ext="\${@##*.}"
shopt -s nocasematch
case "\$ext" in
	"prs" ) $APPPATH/presentations -S\""\$@"\";;
	"pps" ) $APPPATH/presentations -S\""\$@"\";;
	"ppsx" ) $APPPATH/presentations -S\""\$@"\";;
	* ) $APPPATH/presentations "\$@";;
esac
PRES
    #echo 'ext="${@##*.}"' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo "shopt -s nocasematch" >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo 'case "$ext" in' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo '"prs" ) P="-S";;' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo '"pps" ) P="-S";;' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo '"ppsx" ) P="-S";;' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo '* ) P="";;' >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo "esac" >> "$APPBINPATH"/presentations$SHORTVERSION
    #echo "" >> "$APPBINPATH"/presentations$SHORTVERSION
	
   # echo $APPPATH/presentations '$P\""$@"\"' >> "$APPBINPATH"/presentations$SHORTVERSION

	chmod 755 $APPBINPATH"/textmaker$SHORTVERSION"
	chmod 755 $APPBINPATH"/planmaker$SHORTVERSION"
	chmod 755 $APPBINPATH"/presentations$SHORTVERSION"

	if [ $SCRIPT -eq 1 ] ; then
		if [ "$(whoami)" != 'root' ]; then
			cp $SRCPATH/mime/uninst1 $UNINSTALLSCRIPT
		else
			cp $SRCPATH/mime/uninst2 $UNINSTALLSCRIPT
		fi  
		if [ -f "$APPBINPATH"/textmaker$SHORTVERSION ]
		then
			echo "rm -f $APPBINPATH/textmaker$SHORTVERSION" >> $UNINSTALLSCRIPT
		fi
		
		if [ -f "$APPBINPATH"/planmaker$SHORTVERSION ]
		then
			echo "rm -f $APPBINPATH/planmaker$SHORTVERSION" >> $UNINSTALLSCRIPT
		fi
		
		if [ -f "$APPBINPATH"/presentations$SHORTVERSION ]
		then
			echo "rm -f $APPBINPATH/presentations$SHORTVERSION" >> $UNINSTALLSCRIPT
		fi      
	else
        echo '#!/bin/sh' >$UNINSTALLSCRIPT
	fi
    chmod 755 $UNINSTALLSCRIPT

    echo '#!/bin/sh' >$REMOVEICONSSCRIPT
	chmod 755 $REMOVEICONSSCRIPT

}

set_output()
{
	if [ -z $ERROROUTPUT ] || [ "m$ERROROUTPUT" = "m" ] ; then
		if [ -z $CONSOLEOUTPUT ] ; then
			CNT=1
			while [ -f /tmp/sm$SHORTVERSION.$CNT.log ] ; do
				let CNT+=1
			done
			ERROROUTPUT=/tmp/sm$SHORTVERSION.$CNT.log
			touch $ERROROUTPUT
			chmod 666 $ERROROUTPUT
		else
			echo "Output enabled"
			ERROROUTPUT=`tty`
		fi
	fi

#lh 26.06.2020 FS#45762 no mode display information vv
#	NOTSEND=`which notify-send 2>/dev/null`
#	XMSG=`which xmessage 2>/dev/null`
#	echo "NOTSEND is -$NOTSEND-" >> $ERROROUTPUT
#	echo "XMSG is -$XMSG-" >> $ERROROUTPUT
#lh 26.06.2020 FS#45762 no mode display information ^^

	echo "env: " >> $ERROROUTPUT
	printenv|sort >> $ERROROUTPUT
	echo "----------------" >> $ERROROUTPUT
	if [ "m$DISPLAY" = "m" ] ; then
		DISPLAY=":0"
		export DISPLAY 
		echo "DISPLAY set to $DISPLAY" >> $ERROROUTPUT
		echo "----------------" >> $ERROROUTPUT
	fi
}

display_information()
{
	TEXT=$1
	echo "$TEXT"

#lh 26.06.2020 FS#45762 no mode display information vv
#	if [ "m$NOTSEND" != "m" ] ; then
#		notify-send "SoftMaker Office installation" "$TEXT" -t 2000 &
#	else
#		if [ "m$XMSG" != "m" ] ; then
#			xmessage -timeout 2 "$TEXT" &
#		fi
#	fi
#lh 26.06.2020 FS#45762 no mode display information ^^
}

copy_icons()
{   
	VERSION=$1
	if [ $VERSION = "free" ] ; then
		SHORTVERSION="free"
	else
		if [ $VERSION = "beta" ] ; then
			SHORTVERSION=21
		else
			SHORTVERSION=$(($VERSION-2000))
		fi
	fi
	SCRIPT=1
	if [ -z $2 ] ; then
		SCRIPT=0
	else
		if [ $2 = "0" ] ; then
			SCRIPT=0
		fi
	fi

	if [ $SCRIPT -eq 1 ] ; then
#       if global folders for icons exist, create local folders for non-root users
		if [ "$LOCALINSTALL" = "1" -a -d "/usr/share/icons/$THEME" ] ; then
			mkdir -p "$THEMEDIR/48x48/mimetypes"
			mkdir -p "$THEMEDIR/32x32/mimetypes"
			mkdir -p "$THEMEDIR/16x16/mimetypes"
		fi
    fi  

	set_output

	if [ -d "$THEMEDIR" ] ; then        
    	if [ $SCRIPT -eq 1 ] ; then

			if [ "$LOCALINSTALL" = "1" ] ; then
				XDG_MODE=" user "
				
			else
				XDG_MODE=" system "
			fi
		else
			XDG_MODE=" system "
		fi

		FREENAME=""
		if [ $VERSION = "free" ] ; then
			FREENAME="free"
		fi
		if [ $VERSION = "beta" ] ; then
			FREENAME="beta"
		fi

		#if [ "$LOCALINSTALL" != "1" ] ; then
			for SIZE in 16 24 32 48 64 72 128 256 512 1024 ; do
				for APP in prl tml pml ; do
					echo sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $SIZE --theme $THEME --context apps $SRCPATH/icons/"$APP"_"$SIZE".png application-x-"$APP"21"$FREENAME" >>$ERROROUTPUT 
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $SIZE --theme $THEME --context apps $SRCPATH/icons/"$APP"_"$SIZE".png application-x-"$APP"21"$FREENAME" >>$ERROROUTPUT 2>&1	
					echo sh $XDGPATH/xdg-icon-resource uninstall --novendor --mode $XDG_MODE --size $SIZE application-x-"$APP"21"$FREENAME" >> $UNINSTALLSCRIPT
				done
			done		
		#fi

		echo "LOOP start"  >>$ERROROUTPUT
		
		cd /usr/share/icons
		# ALLTHEMES=`echo *`
		#lh 12.10.2017 FS#37057
		ALLTHEMES=`find * | grep 'msword\|excel\|powerpoint\|hicolor' | xargs dirname | xargs dirname | xargs dirname | grep -v '\.' | sort | uniq`

		cd $SRCPATH/icons/

		ICONCACHECMD=`which update-icon-caches 2>/dev/null` 
#lh 20.07.2020 FS#45876 two loops instead of one.
		echo "" > $UNINSTALLSCRIPT.1
		echo "" > $REMOVEICONSSCRIPT.1
		ALLMIMES="application-x-tmd\|application-x-tmv"
		for VAR in application-rtf text-rtf application-msword application-msword-template application-vnd.ms-word application-x-doc application-x-pocket-word application-vnd.openxmlformats-officedocument.wordprocessingml.document application-vnd.openxmlformats-officedocument.wordprocessingml.template application-vnd.ms-word.document.macroenabled.12 application-vnd.ms-word.template.macroenabled.12 ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in application-x-pocket-word application-vnd.oasis.opendocument.text text-rtf application-vnd.sun.xml.writer application-vnd.sun.xml.writer.template application-vnd.wordperfect application-vnd.oasis.opendocument.text-template application-vnd.oasis.opendocument.text application-vnd.sun.xml.writer application-vnd.sun.xml.writer.template application-x-dbf ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in application-x-pmd application-x-pmv application-x-pmdx application/x-pagemaker ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in application-x-sylk application-excel application-x-excel application-x-ms-excel application-x-msexcel application-x-xls application-xls application-vnd.ms-excel application-vnd.openxmlformats-officedocument.spreadsheetml.sheet application-vnd.openxmlformats-officedocument.spreadsheetml.template application-vnd.ms-excel.sheet.macroenabled.12 application-vnd.ms-excel.template.macroenabled.12 text-spreadsheet ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in text-csv application-x-dif application-x-prn application-vnd.stardivision.calc ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in application-x-prd application-x-prs application-x-prv ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		for VAR in application-ppt application-mspowerpoint application-vnd.ms-powerpoint application-vnd.ms-powerpoint.presentation.macroenabled.12 application-vnd.ms-powerpoint.slideshow.macroEnabled.12 application-vnd.openxmlformats-officedocument.presentationml.presentation application-vnd.openxmlformats-officedocument.presentationml.template application-vnd.openxmlformats-officedocument.presentationml.slideshow ; do
			ALLMIMES="$ALLMIMES\|$VAR"
		done
		ALLMIMES="$ALLMIMES\|x-office-document\|x-office-spreadsheet\|wordprocessing"

		for THEME in $ALLTHEMES ; do
			if [ -d /usr/share/icons/$THEME ] ; then
				echo "Updating theme $THEME /1 of 2/"
				echo "Updating theme $THEME /1 of 2/">>$ERROROUTPUT 
				echo "echo Removing icons from theme $THEME /2 of 2/" >> $UNINSTALLSCRIPT.1
				echo "echo Removing icons from theme $THEME /2 of 2/" >> $REMOVEICONSSCRIPT.1
				
				for ICON in 16 32 48 64 128 ; do
					for VAR in application-x-tmd application-x-tmv ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-rtf text-rtf application-msword application-msword-template application-vnd.ms-word application-x-doc application-x-pocket-word application-vnd.openxmlformats-officedocument.wordprocessingml.document application-vnd.openxmlformats-officedocument.wordprocessingml.template application-vnd.ms-word.document.macroenabled.12 application-vnd.ms-word.template.macroenabled.12 application-vnd.oasis.opendocument.text application-vnd.oasis.opendocument.text-template application-vnd.sun.xml.writer application-vnd.sun.xml.writer.template ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-pmd application-x-pmv application-x-pmdx ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-sylk application-excel application-x-excel application-x-ms-excel application-x-msexcel application-x-xls application-xls application-vnd.ms-excel application-vnd.openxmlformats-officedocument.spreadsheetml.sheet application-vnd.openxmlformats-officedocument.spreadsheetml.template application-vnd.ms-excel.sheet.macroenabled.12 application-vnd.ms-excel.template.macroenabled.12 ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-prd application-x-prs application-x-prv ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-ppt application-mspowerpoint application-vnd.ms-powerpoint application-vnd.ms-powerpoint.presentation.macroenabled.12 application-vnd.ms-powerpoint.slideshow.macroEnabled.12 application-vnd.openxmlformats-officedocument.presentationml.presentation application-vnd.openxmlformats-officedocument.presentationml.template application-vnd.openxmlformats-officedocument.presentationml.slideshow ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
					done
				done

				UPDDIR=/usr/share/icons/$THEME/mimes/
				if [ -d $UPDDIR ] ; then
					echo "$THEME modification start"
					echo "$THEME modification start ($UPDDIR)"  >>$ERROROUTPUT
				else
					UPDDIR=/usr/share/icons/$THEME/mimetypes/
				fi


#				for UPDDIR in /usr/share/icons/$THEME/mimes/ /usr/share/icons/$THEME/mimetypes/ ; do
				UPDDIR="/usr/share/icons/$THEME/"

				if [ -d $UPDDIR ] ; then
# now there should not be any .old files. Let's check and remove them if they exist
					find $UPDDIR* -name *.old > /tmp/1.txt
					cat /tmp/1.txt | sed 's/.old//g' > /tmp/2.txt
					OLDFILES=`cat /tmp/2.txt | sort | uniq`
					for i in $OLDFILES ; do
						for j in `grep "$i" /tmp/1.txt | sort` ; do
#							echo "moving $j -> $i"
							mv $j $i
						done
					done
					rm /tmp/1.txt
					rm /tmp/2.txt
					
					if [ "$LOCALINSTALL" != "1" ] ; then
						echo "ALLMIMES = ($ALLMIMES)" >> $ERROROUTPUT
						for i in `find $UPDDIR*| grep "$ALLMIMES"` ; do
							echo $i >> $ERROROUTPUT
							mv $i $i.old
							echo "mv $i.old $i" >> $UNINSTALLSCRIPT.1
							echo "mv $i.old $i" >> $REMOVEICONSSCRIPT.1
						done
					else
					for ICON in 16 32 48 64 128 ; do
						if [ "$LOCALINSTALL" != "1" ] ; then
							if [ -d $UPDDIR/$ICON ] ; then
								if [ -d /usr/share/icons/$THEME/"$ICON"x"$ICON"/mimetypes ] ; then
									cd $UPDDIR/$ICON
									for i in pmd pmdx pmv prd prs prv tmd tmv; do
										if [ -f $UPDDIR/$ICON/$i ] ; then
											rm $UPDDIR/$ICON/$i
										fi
									done
									cd /usr/share/icons/$THEME/"$ICON"x"$ICON"/mimetypes
									for i in `echo *` ; do
									  	if [ -f $UPDDIR/$ICON/$i ] ; then
									  		mv $UPDDIR/$ICON/$i $UPDDIR/$ICON/$i.old
									  		echo "mv $UPDDIR/$ICON/$i.old $UPDDIR/$ICON/$i" >> $UNINSTALLSCRIPT.1
									  		echo "mv $UPDDIR/$ICON/$i.old $UPDDIR/$ICON/$i" >> $REMOVEICONSSCRIPT.1
									  		cp /usr/share/icons/$THEME/"$ICON"x"$ICON"/mimetypes/$i $UPDDIR/$ICON/
									  	else
									  		echo "rm $UPDDIR/$ICON/$i" >> $UNINSTALLSCRIPT.1
									  		echo "rm $UPDDIR/$ICON/$i" >> $REMOVEICONSSCRIPT.1
									  		if [ ! -d $UPDDIR/$ICON ] ; then
										  		mkdir -p $UPDDIR/$ICON
										  		echo "[mimes/$ICON]" >> /usr/share/icons/$THEME/index.theme
										  		echo "Size=$ICON" >> /usr/share/icons/$THEME/index.theme
										  		echo "Context=MimeTypes" >> /usr/share/icons/$THEME/index.theme
										  		echo "Type=Fixed" >> /usr/share/icons/$THEME/index.theme
										  		echo " " >> /usr/share/icons/$THEME/index.theme
										  		DIR0=`grep Directories /usr/share/icons/$THEME/index.theme`
										  		DIR1="$DIR0,mimes/$ICON"
										  		sed -i "s:$DIR0:$DIR1:g" /usr/share/icons/$THEME/index.theme
										  	fi
									  		cp /usr/share/icons/$THEME/"$ICON"x"$ICON"/mimetypes/$i $UPDDIR/$ICON/					  		
									  	fi
									done
								fi
							fi
						else
							cd
							if [ -d .local/share/icons/$THEME ] ; then
								cd .local/share/icons/$THEME
								LDIR=`pwd`
								if [ ! -d $UPDDIR/$ICON ] ; then
									if [ ! -f index.theme ] ; then 
										if [ -f /usr/share/icons/$THEME/index.theme ] ; then 
											cp /usr/share/icons/$THEME/index.theme .
											echo "index.theme copied"
										fi
									fi
							  		echo "[mimes/$ICON]" >> index.theme
							  		echo "Size=$ICON" >> index.theme
							  		echo "Context=MimeTypes" >> index.theme
							  		echo "Type=Fixed" >> index.theme
							  		echo " " >> index.theme
							  		DIR0=`grep Directories index.theme`
							  		if [ "M$DIR0" != "M" ] ; then
								  		DIR1="$DIR0,mimes/$ICON"
								  		sed -i "s:$DIR0:$DIR1:g" index.theme
								  		echo "DIR0=$DIR0" >>$ERROROUTPUT
								  	fi
								fi
								mkdir -p mimes/$ICON
								mkdir -p "$ICON"x"$ICON"/mimetypes
								mkdir -p "$ICON"x"$ICON"/mimetypes
								for i in `ls "$ICON"x"$ICON"/mimetypes` ; do 
									cp "$ICON"x"$ICON"/mimetypes/$i mimes/$ICON/
								done
								echo "rm -fr $LDIR/mimes/$ICON" >> $UNINSTALLSCRIPT.1
								echo "rm -fr $LDIR/mimes/$ICON" >> $REMOVEICONSSCRIPT.1
							fi
						fi
					done
					fi
				fi
#				done

				sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME >>$ERROROUTPUT 2>&1
				echo "sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME" >> $UNINSTALLSCRIPT.1
				echo "sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME" >> $REMOVEICONSSCRIPT.1
				if [ "m$ICONCACHECMD" != "m" -a "$LOCALINSTALL" != "1" ] ; then
					update-icon-caches /usr/share/icons/$THEME
					echo "update-icon-caches /usr/share/icons/$THEME" >> $UNINSTALLSCRIPT.1
					echo "update-icon-caches /usr/share/icons/$THEME" >> $REMOVEICONSSCRIPT.1
				fi
			else 
				echo "$THEME skipped">>$ERROROUTPUT
			fi
		done	

		for THEME in $ALLTHEMES ; do
			if [ -d /usr/share/icons/$THEME ] ; then
				echo "Updating theme $THEME /2 of 2/"
				echo "Updating theme $THEME /2 of 2/">>$ERROROUTPUT 
				echo "echo Removing icons from theme $THEME /1 of 2/" >> $UNINSTALLSCRIPT
				echo "echo Removing icons from theme $THEME /1 of 2/" >> $REMOVEICONSSCRIPT

				UPDDIR=/usr/share/icons/$THEME/mimes/
				if [ -d $UPDDIR ] ; then
					echo "$THEME modification start"
					echo "$THEME modification start ($UPDDIR)"  >>$ERROROUTPUT
				else
					UPDDIR=/usr/share/icons/$THEME/mimetypes/
				fi

#				for UPDDIR in /usr/share/icons/$THEME/mimes/ /usr/share/icons/$THEME/mimetypes/ ; do
				UPDDIR="/usr/share/icons/$THEME/"

				for ICON in 48 16 32 64 128 ; do
				if true; then
					
					for VAR in application-x-tmd application-x-tmv ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-rtf text-rtf application-msword application-msword-template application-vnd.ms-word application-x-doc application-x-pocket-word application-vnd.openxmlformats-officedocument.wordprocessingml.document application-vnd.openxmlformats-officedocument.wordprocessingml.template application-vnd.ms-word.document.macroenabled.12 application-vnd.ms-word.template.macroenabled.12 ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $REMOVEICONSSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_mso_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-pocket-word application-vnd.oasis.opendocument.text text-rtf application-vnd.sun.xml.writer application-vnd.sun.xml.writer.template application-vnd.wordperfect application-vnd.oasis.opendocument.text-template application-vnd.oasis.opendocument.text application-vnd.sun.xml.writer application-vnd.sun.xml.writer.template application-x-dbf ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $REMOVEICONSSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_oth_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-pmd application-x-pmv application-x-pmdx application/x-pagemaker ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-sylk application-excel application-x-excel application-x-ms-excel application-x-msexcel application-x-xls application-xls application-vnd.ms-excel application-vnd.openxmlformats-officedocument.spreadsheetml.sheet application-vnd.openxmlformats-officedocument.spreadsheetml.template application-vnd.ms-excel.sheet.macroenabled.12 application-vnd.ms-excel.template.macroenabled.12 text-spreadsheet ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $REMOVEICONSSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_mso_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in text-csv application-x-dif application-x-prn application-vnd.stardivision.calc ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $REMOVEICONSSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_oth_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-x-prd application-x-prs application-x-prv ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/prd_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
					for VAR in application-ppt application-mspowerpoint application-vnd.ms-powerpoint application-vnd.ms-powerpoint.presentation.macroenabled.12 application-vnd.ms-powerpoint.slideshow.macroEnabled.12 application-vnd.openxmlformats-officedocument.presentationml.presentation application-vnd.openxmlformats-officedocument.presentationml.template application-vnd.openxmlformats-officedocument.presentationml.slideshow ; do
						sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR >>$ERROROUTPUT 2>&1
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $UNINSTALLSCRIPT
						echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $VAR" >> $REMOVEICONSSCRIPT
						sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/prd_mso_$ICON.png $VAR >>$ERROROUTPUT 2>&1
					done
#				else
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-tmd" >> $UNINSTALLSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_$ICON.png application-x-tmd >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-tmd-mso" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-tmd-mso" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_mso_$ICON.png application-x-tmd-mso >>$ERROROUTPUT 2>&1
						
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-tmd-oth" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-tmd-oth" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/tmd_oth_$ICON.png application-x-tmd-oth >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-pmd" >> $UNINSTALLSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_$ICON.png application-x-pmd >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-pmd-mso" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-pmd-mso" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_mso_$ICON.png application-x-pmd-mso >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-pmd-oth" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-pmd-oth" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/pmd_oth_$ICON.png application-x-pmd-oth >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-prd" >> $UNINSTALLSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/prd_$ICON.png application-x-prd >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-prd-mso" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-prd-mso" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/prd_mso_$ICON.png application-x-prd-mso >>$ERROROUTPUT 2>&1

					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-prd-oth" >> $UNINSTALLSCRIPT
					echo "sh $XDGPATH/xdg-icon-resource uninstall --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes application-x-prd-oth" >> $REMOVEICONSSCRIPT
					sh $XDGPATH/xdg-icon-resource install --novendor --noupdate --mode $XDG_MODE --size $ICON --theme $THEME --context mimetypes $SRCPATH/icons/prd_oth_$ICON.png application-x-prd-oth >>$ERROROUTPUT 2>&1
				fi				
				done
				
				sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME >>$ERROROUTPUT 2>&1
				echo "sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME" >> $UNINSTALLSCRIPT
				echo "sh $XDGPATH/xdg-icon-resource forceupdate --mode $XDG_MODE --theme $THEME" >> $REMOVEICONSSCRIPT
				if [ "m$ICONCACHECMD" != "m" -a "$LOCALINSTALL" != "1" ] ; then
					update-icon-caches /usr/share/icons/$THEME
					echo "update-icon-caches /usr/share/icons/$THEME" >> $UNINSTALLSCRIPT
					echo "update-icon-caches /usr/share/icons/$THEME" >> $REMOVEICONSSCRIPT
				fi
			else 
				echo "$THEME skipped">>$ERROROUTPUT
			fi
		done
		cat $UNINSTALLSCRIPT.1 >> $UNINSTALLSCRIPT
		cat $REMOVEICONSSCRIPT.1 >> $REMOVEICONSSCRIPT
		rm $UNINSTALLSCRIPT.1
		rm $REMOVEICONSSCRIPT.1
	fi
}

modify_defaults()
{
echo "Called with params $1 $2"
	APP=$1
	FILE=$2
	LL=`grep -R "$APP" "$FILE"`
echo GREP is $LL
CC=`cat "$FILE"`
echo CC is $CC
	for LINE in `cat "$FILE"|grep "$APP"` ; do
		LINE1=`echo $LINE|cut -d "=" -f 1`
		LINE2=`echo $LINE|cut -d "=" -f 2`
		LINE3=`echo $LINE2|sed 's/;/ /'`
echo $LINE1 $LINE2 -- $LINE3
		LINE4="$APP"
		for i in $LINE3; do
			if [ "$i" != "$APP" ] ; then
				LINE4="$LINE4;$i"
			fi
		done
echo "Changing $LINE1 -- $LINE4"
echo "Changing $LINE1 -- $LINE4" >>$ERROROUTPUT 2>&1
		sed -i "s:$LINE:$LINE1=$LINE4:g" $FILE
	done
}

create_mime()
{
	VERSION=$1
	SHORTVERSION=$(($VERSION-2000))
	SCRIPT=1
	if [ -z $2 ] ; then
		SCRIPT=0
	else
		if [ $2 = "0" ] ; then
			SCRIPT=0
		fi
	fi

	echo "Create MIME"
	display_information "Adding document icons. This may take a few minutes..."
	#echo "Adding document icons..."
	echo "echo Removing document icons..."  >> $UNINSTALLSCRIPT
	echo "echo Removing document icons..."  >> $REMOVEICONSSCRIPT
	
    THEMEDIR="$DATADIR/icons/hicolor"             
    THEME="hicolor"

    copy_icons $VERSION $SCRIPT

    display_information "Registering MIME types..."
	#echo "Registering MIME types..."
	if [ $SCRIPT -eq 1 ] ; then
		if [ "$LOCALINSTALL" = "1" ] ; then
			XDG_MODE=" --mode user "
		else
			XDG_MODE=" --mode system "

			display_information "Creating /etc/SoftMaker folder..."
			mkdir -p /etc/SoftMaker
			chmod 777 /etc/SoftMaker
		fi
	else
		XDG_MODE=" --mode system "

		display_information "Creating /etc/SoftMaker folder..."
		mkdir -p /etc/SoftMaker
		chmod 777 /etc/SoftMaker
	fi

	set_output

	#fix for KDE Bug 343468
	if [ "$LOCALINSTALL" != "1" ] ; then
		echo "Fix for KDE Bug 343468:" >>$ERROROUTPUT 2>&1
		for I in /usr/share/mime/subclasses /usr/share/mime/types ; do
			#echo "--file: $I" >>$ERROROUTPUT 2>&1
			sed -i 's:macroEnabled:macroenabled:g' $I
		done
	fi
	
	if [ $VERSION = "free" ] ; then
		sh $XDGPATH/xdg-mime install $XDG_MODE --novendor $SRCPATH/mime/softmaker-freeoffice21.xml  
	else
		sh $XDGPATH/xdg-mime install $XDG_MODE --novendor $SRCPATH/mime/softmaker-office-2021.xml  
	fi

	echo "echo Unregistering MIME types..." >> $UNINSTALLSCRIPT

	if [ $VERSION = "free" ] ; then
		echo "sh $XDGPATH/xdg-mime uninstall $XDG_MODE --novendor $SRCPATH/mime/softmaker-freeoffice21.xml" >> $UNINSTALLSCRIPT
	else
		echo "sh $XDGPATH/xdg-mime uninstall $XDG_MODE --novendor $SRCPATH/mime/softmaker-office-2021.xml" >> $UNINSTALLSCRIPT
	fi

	ISKDE=`ps -ef | grep kde | wc -l`
	echo "mkdir -p ~/.local/share/applications/" > /tmp/mime.sh

	if [ $VERSION = "free" ] ; then
		echo "sh $XDGPATH/xdg-mime install --mode user --novendor $SRCPATH/mime/softmaker-freeoffice21.xml  " >> /tmp/mime.sh
	else
		echo "sh $XDGPATH/xdg-mime install --mode user --novendor $SRCPATH/mime/softmaker-office-2021.xml  " >> /tmp/mime.sh
	fi

	if [ $VERSION = "free" ] ; then
		TMDESKTOPNAME=textmaker-$VERSION"21".desktop
		PMDESKTOPNAME=planmaker-$VERSION"21".desktop
		PRDESKTOPNAME=presentations-$VERSION"21".desktop
	else
		if [ $VERSION = "beta" ] ; then
			SHORTVERSION="beta"
		else
			SHORTVERSION=$(($VERSION-2000))
		fi
		TMDESKTOPNAME=textmaker-$SHORTVERSION.desktop
		PMDESKTOPNAME=planmaker-$SHORTVERSION.desktop
		PRDESKTOPNAME=presentations-$SHORTVERSION.desktop
	fi
	echo "$XDGPATH/xdg-mime default $TMDESKTOPNAME application/x-tmd application/x-tmv application/msword application/vnd.ms-word application/x-doc text/rtf application/rtf application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.text-template application/vnd.stardivision.writer application/vnd.sun.xml.writer application/vnd.sun.xml.writer.template application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-word.document.macroenabled.12 application/vnd.ms-word.document.macroEnabled.12 application/vnd.openxmlformats-officedocument.wordprocessingml.template application/vnd.ms-word.template.macroenabled.12 application/vnd.ms-word.template.macroEnabled.12 application/x-pocket-word application/vnd.wordperfect application/x-dbf " >> /tmp/mime.sh
	echo "$XDGPATH/xdg-mime default $PMDESKTOPNAME application/x-pmd application/x-pmdx application/x-pmv application/excel application/x-excel application/x-ms-excel application/x-msexcel application/x-sylk application/x-xls application/xls application/vnd.ms-excel application/vnd.stardivision.calc application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.spreadsheetml.template application/vnd.ms-excel.sheet.macroenabled.12 application/vnd.ms-excel.sheet.macroEnabled.12 application/vnd.openxmlformats-officedocument.spreadsheetml.template application/vnd.ms-excel.template.macroenabled.12 application/vnd.ms-excel.template.macroEnabled.12 text/csv application/x-dif application/x-prn text/spreadsheet application/vnd.oasis.opendocument.spreadsheet application/vnd.oasis.opendocument.spreadsheet-template" >> /tmp/mime.sh
	echo "$XDGPATH/xdg-mime default $PRDESKTOPNAME application/x-prd application/x-prv application/x-prs application/ppt application/mspowerpoint application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/vnd.ms-powerpoint.presentation.macroenabled.12 application/vnd.ms-powerpoint.presentation.macroEnabled.12 application/vnd.openxmlformats-officedocument.presentationml.template application/vnd.ms-powerpoint.template.macroenabled.12 application/vnd.ms-powerpoint.template.macroEnabled.12 application/vnd.ms-powerpoint.slideshow.macroenabled.12 application/vnd.ms-powerpoint.slideshow.macroEnabled.12 application/vnd.openxmlformats-officedocument.presentationml.slideshow " >> /tmp/mime.sh		

#	if [ $ISKDE -gt 5 ] ; then
	if [ "$LOCALINSTALL" != "1" ] ; then
		echo "perl $SRCPATH/mime/def.pl ~/.local/share/applications/mimeapps.list $TMDESKTOPNAME $PMDESKTOPNAME $PRDESKTOPNAME"  >> /tmp/mime.sh
		echo "perl $SRCPATH/mime/def.pl ~/.config/mimeapps.list $TMDESKTOPNAME $PMDESKTOPNAME $PRDESKTOPNAME"  >> /tmp/mime.sh
	fi
	echo "rm ~/.local/share/mime/application/vnd.ms-word.template.macroenabled.12.xml" >> /tmp/mime.sh
	echo "rm ~/.local/share/mime/application/vnd.ms-excel.template.macroenabled.12.xml" >> /tmp/mime.sh
	
	echo "mime.sh:" >>$ERROROUTPUT 2>&1
	cat /tmp/mime.sh >>$ERROROUTPUT 2>&1
	echo "---" >>$ERROROUTPUT 2>&1

	if [ "$LOCALINSTALL" != "1" ] ; then
		for INSTUSERNAME in `grep -v bin/nologin /etc/passwd | grep -wFf /etc/shells | cut -d: -f 1` ; do
			if [ -f "$XDGPATH/xdg-user-dir" ] ; then
				DesktopDir=`su $INSTUSERNAME -c "/bin/sh $XDGPATH/xdg-user-dir DESKTOP" 2>/dev/null` 2>/dev/null
			else
				DesktopDir=`grep "$INSTUSERNAME:" /etc/passwd | cut -f 6 -d":"`
				DesktopDir="$DesktopDir/Desktop"
			fi
			if [ -d "$DesktopDir" ] ; then
				echo "Installing for user $INSTUSERNAME"
 
				SUCMD="su $INSTUSERNAME -c"
				echo $SUCMD \"sh /tmp/mime.sh\" >>$ERROROUTPUT 2>&1
				$SUCMD "sh /tmp/mime.sh" >>$ERROROUTPUT 2>&1			
				
				if [ $VERSION = "free" ] ; then
					echo "$SUCMD \"sh $XDGPATH/xdg-mime uninstall --mode user $SRCPATH/mime/softmaker-freeoffice21.xml\"" >> $UNINSTALLSCRIPT
				else
					echo "$SUCMD \"sh $XDGPATH/xdg-mime uninstall --mode user $SRCPATH/mime/softmaker-office-2021.xml\"" >> $UNINSTALLSCRIPT
				fi
			fi
		done
		# fix for kde bug https://bugs.kde.org/show_bug.cgi?id=343468
		sed -i 's:macroEnabled:macroenabled:g' /usr/share/mime/subclasses			
	else
		#sh /tmp/icons.sh
		sh /tmp/mime.sh
	fi
	
	TMPCMD=`which update-mime-database 2>/dev/null` 
	if [ ! "$TMPCMD" = ""  ] ; then
		update-mime-database /usr/share/mime >/dev/null 2>&1
	fi

#	if [ $ISKDE -gt 5 ] ; then
	if [ "$LOCALINSTALL" != "1" ] ; then
		DEFAULTFILE="/usr/share/applications/defaults.list"
		if [ -f "$DEFAULTFILE" ] ; then
			cp $DEFAULTFILE /tmp/defaults.old.txt
			for i in application/x-tmd application/x-tmv application/msword application/vnd.ms-word application/x-doc text/rtf application/rtf application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.text-template application/vnd.stardivision.writer application/vnd.sun.xml.writer application/vnd.sun.xml.writer.template application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-word.document.macroenabled.12 application/vnd.ms-word.document.macroEnabled.12 application/vnd.openxmlformats-officedocument.wordprocessingml.template application/vnd.ms-word.template.macroenabled.12 application/vnd.ms-word.template.macroEnabled.12 application/x-pocket-word application/vnd.wordperfect application/x-dbf ; do
				LINE=`grep "$i=" $DEFAULTFILE`
				if [ "M$LINE" != "M" ] ; then
							LINE1=`echo $LINE|cut -d "=" -f 1`
							LINE2=`echo $LINE|cut -d "=" -f 2`
	echo "Changing $LINE1 -- $LINE2" >>$ERROROUTPUT 2>&1
							sed -i "s:$LINE:$LINE1=$TMDESKTOPNAME;$LINE2:g" $DEFAULTFILE
			
				fi
			done
			for i in application/x-pmd application/x-pmdx application/x-pmv application/excel application/x-excel application/x-ms-excel application/x-msexcel application/x-sylk application/x-xls application/xls application/vnd.ms-excel application/vnd.stardivision.calc application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.spreadsheetml.template application/vnd.ms-excel.sheet.macroenabled.12 application/vnd.ms-excel.sheet.macroEnabled.12 application/vnd.openxmlformats-officedocument.spreadsheetml.template application/vnd.ms-excel.template.macroenabled.12 application/vnd.ms-excel.template.macroEnabled.12 text/csv application/x-dif application/x-prn text/spreadsheet application/vnd.oasis.opendocument.spreadsheet application/vnd.oasis.opendocument.spreadsheet-template ; do
				LINE=`grep "$i=" $DEFAULTFILE`
				if [ "M$LINE" != "M" ] ; then
							LINE1=`echo $LINE|cut -d "=" -f 1`
							LINE2=`echo $LINE|cut -d "=" -f 2`
	echo "Changing $LINE1 -- $LINE2" >>$ERROROUTPUT 2>&1
							sed -i "s:$LINE:$LINE1=$PMDESKTOPNAME;$LINE2:g" $DEFAULTFILE
			
				fi
			done
			for i in application/x-prd application/x-prv application/x-prs application/ppt application/mspowerpoint application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/vnd.ms-powerpoint.presentation.macroenabled.12 application/vnd.ms-powerpoint.presentation.macroEnabled.12 application/vnd.openxmlformats-officedocument.presentationml.template application/vnd.ms-powerpoint.template.macroenabled.12 application/vnd.ms-powerpoint.template.macroEnabled.12 application/vnd.ms-powerpoint.slideshow.macroenabled.12 application/vnd.ms-powerpoint.slideshow.macroEnabled.12 application/vnd.openxmlformats-officedocument.presentationml.slideshow ; do
				LINE=`grep "$i=" $DEFAULTFILE`
				if [ "M$LINE" != "M" ] ; then
							LINE1=`echo $LINE|cut -d "=" -f 1`
							LINE2=`echo $LINE|cut -d "=" -f 2`
	echo "Changing $LINE1 -- $LINE2" >>$ERROROUTPUT 2>&1
							sed -i "s:$LINE:$LINE1=$PRDESKTOPNAME;$LINE2:g" $DEFAULTFILE
			
				fi
			done
			cp $DEFAULTFILE /tmp/defaults.new.txt
		else 
			echo "No default apps file"
			echo "No default apps file" >>$ERROROUTPUT 2>&1
		fi
		
		#remove the KDE cache if exists
		for i in `echo /var/tmp/kdecache-*` ; do
			echo "Cleaning the cache from folder: $i/*" >>$ERROROUTPUT 2>&1
			echo "Cleaning the cache from folder: $i/*" 
			rm -rf $i/*
			echo "rm -rf $i/*" >> $UNINSTALLSCRIPT
			echo "rm -rf $i/*" >> $REMOVEICONSSCRIPT
		done
	fi
	
	echo "Icons forceupdate start"  >>$ERROROUTPUT
	sh $XDGPATH/xdg-icon-resource forceupdate --novendor $XDG_MODE >>$ERROROUTPUT 2>&1

	rm -f /tmp/mime.sh

    # Correct language dor Berlitz dictionaries
	LNG=`echo $LANG|cut -f 1 -d"_" 2>/dev/null` 
	case "$LNG" in
		de) ;;
		es) ;;
		*) LNG="en" ;;
	esac
	if [ -f "$APPPATH/spell/langenscheidt_$LNG.thn" ] ; then
	echo "langenscheidt_$LNG.thn chosen" >>$ERROROUTPUT 2>&1
		mv $APPPATH/spell/langenscheidt_$LNG.thn $APPPATH/spell/langenscheidt.thn
		rm $APPPATH/spell/langenscheidt_*.thn
		echo "rm $APPPATH/spell/langenscheidt.thn" >> $UNINSTALLSCRIPT
		echo "rm -fr $APPPATH" >> $UNINSTALLSCRIPT
	fi
}  


set -e
set +e
		
DATADIR=/usr/share
APPPATH=$DATADIR/office2021
APPBINPATH="/usr/bin"
SRCPATH=$APPPATH
TMPCMD=`which xdg-mime 2>/dev/null` 

if [ "$TMPCMD" = "" ] 
then
	echo "Using xdg-utils supplied by this package"
	XDGPATH=$SRCPATH/mime/xdg-utils
else
	echo "Using existing xdg-utils"
	TMPCMD2="dirname $TMPCMD"
	XDGPATH=`$TMPCMD2` 
fi

UNINSTALLSCRIPT=$APPPATH/mime/unregister_smoffice2021
echo "#!/bin/sh" >$UNINSTALLSCRIPT
chmod 755 $UNINSTALLSCRIPT

REMOVEICONSSCRIPT=$APPPATH/mime/remove_icons.sh
echo "#!/bin/sh" >$REMOVEICONSSCRIPT
chmod 755 $REMOVEICONSSCRIPT
			
create_script 2021 "0"
create_mime 2021 "0"
create_desktop2 2021 "0"
			
TMPCMD=`which update-mime-database 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ]
then
	update-mime-database /usr/share/mime >/dev/null 2>&1
fi
			
TMPCMD=`which update-desktop-database 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ]
then
	update-desktop-database /usr/share/applications >/dev/null 2>&1
	update-desktop-database /usr/share/mimelnk/application >/dev/null 2>&1
fi
			
TMPCMD=`which gtk-update-icon-cache 2>/dev/null` 
if [ ! "$TMPCMD" = ""  ]
then
	touch --no-create /usr/share/icons/hicolor
	gtk-update-icon-cache --ignore-theme-index /usr/share/icons/hicolor >/dev/null 2>&1
fi

ldconfig
