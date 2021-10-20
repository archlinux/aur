#!/usr/bin/env bash

FILENAME="./flashpoint-10-linux-x64.7z"
DOWNLOAD_URL="https://bluepload.unstable.life/flashpoint-10-linux-x64.7z"
VALID_SIGNATURE="af8a8ff804a4d5416e15625f67ab4ad5d6bbb5d0d15e83ff5bdb813a7ddf8de8  $FILENAME"
DOWNLOAD_PATH=~/.cache/flashpoint-data
DOWNLOAD_FULLPATH="$DOWNLOAD_PATH/$FILENAME"
INSTALL_PARENT=~/.local/share/
INSTALL_PATH=${INSTALL_PARENT}flashpoint
FILECHECK_PATH=$INSTALL_PATH/Manual.pdf
FILECHECK_SIGNATURE="050348bc0435fa4490ff1be635b1b171b135bcf0d990383be001332241489761"


download(){
	echo "Downloading to $DOWNLOAD_FULLPATH"
	wget $DOWNLOAD_URL
}

getfilesignature(){
	sha256sum $FILENAME
}

printfilesignature(){
	echo "Actual download signature: \n$(getfilesignature)\nExpected download signature: \n$VALID_SIGNATURE\n"
}

checkfilesignature(){
	if [ "$(getfilesignature)" = "$VALID_SIGNATURE" ]; then
		echo true
	else
		echo false
	fi
}

install(){
	echo "Unpacking files ..."
	mkdir -p $INSTALL_PARENT
	7z x $FILENAME -o$INSTALL_PARENT -aoa
}

fix_files(){
	echo "Fixing Data/Servives.json ..."
	echo \
'{
  "watch": [
	 "<fpPath>/Legacy/logs/access.log"
  ],
  "server": [
	 {
		"name": "PHP Router",
		"path": "Legacy",
		"filename": "php",
		"arguments": ["-S", "127.0.0.1:22600", "router.php"],
		"kill": true
	 },
	 {
		"name": "MAD4FP Mode",
		"path": "Legacy",
		"filename": "php",
		"arguments": ["-S", "127.0.0.1:22600", "router_mad4fp.php"],
		"kill": true,
		"mad4fp": true
	 },
	 {
		"name": "Legacy Webserver",
		"path": "Legacy",
		"filename": "httpd",
		"arguments": ["-f", "<fpPath>/Legacy/conf/httpd.conf", "-X"],
		"kill": true
	 }
  ],
  "daemon": [
	 {
		"name": "Apache Webserver",
		"path": "Server",
		"filename": "qemu-system-i386",
		"arguments": ["-machine", "pc-i440fx-6.0", "-m", "512", "-net", "nic,model=e1000", "-net", "user,hostfwd=tcp:127.0.0.1:22500-:80", "-qmp", "tcp:127.0.0.1:4444,server,nowait", "-qmp", "tcp:127.0.0.1:4445,server,nowait", "-hda", "alpine.qcow2", "-loadvm", "quick", "-display", "none"],
		"kill": true
	 }
  ],
  "start": [
	 {
		"path": "Legacy",
		"filename": "php",
		"arguments": ["-f", "update_httpdconf_main_dir.php"]
	 }
  ],
  "stop": [
	 {
		"path": "Legacy",
		"filename": "php",
		"arguments": ["-f", "reset_httpdconf_main_dir.php"]
	 }
  ]
}
' > ${INSTALL_PATH}/Data/services.json
}

delete_cache(){
	rm -v $FILENAME
}

download_check (){
	# Download Archive
	echo "Downloading data ..."
		if [ -f $FILENAME ]; then
			echo "Download already found"
						echo "File Signature: $(getfilesignature) $VALID_SIGNATURE"
			if $(checkfilesignature); then
				echo "valid signature > using cached file"
			else
				echo "Invalid signature > redownloading"
				delete_cache
				download
			fi
		else 
			download
		fi
}

uninstall (){
	rm -r $INSTALL_PARENT
	delete_cache
}

install_check(){
		printfilesignature
# Extract archive
		if $(checkfilesignature) ; then
			echo "Valid signature"
			install
		else
			echo "invalid file signature - canceling"
		fi
}

getfilechecksignature(){
	checksum=($(sha256sum $FILECHECK_PATH))
	echo $checksum
}

check_install(){
	if [ -f $FILECHECK_PATH ]; then
		echo "Expected File checksum: $FILECHECK_SIGNATURE
Actual File checksum: $(getfilechecksignature)"
		if [[ $(getfilechecksignature) == $FILECHECK_SIGNATURE ]] ; then
			echo "Install Verified"
		else
			echo "Verification of Install failed"
		fi
	else
		echo "ERROR: Not Installed or nor fully extracted"
	fi
	
}

mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
case $1 in
	'install'| 'reinstall')
		download_check
		install_check
		fix_files
		check_install
	;;
	'force-install' )
		delete_cache
		download
		install
	;;
	'fix')
		fix_files
	;;
	'full-reinstall')
		uninstall
		download_check
		install
	;;
	'uninstall')
		uninstall
	;;
	'check' )
		  check_install
	 ;;
	* )
		if [[ $1 != '' ]] ; then
			echo "unknown command $1
"
		fi

		echo \
"Command line tool to install Flashpoint data files

Commands:

install : Iinstall files with integrity check
reinstall: Reinstall files - Keeping user data 
fix: fix installed files (nessesary for installs before 10/21/2021 )
force-install: install without integrity check
full-reinstall: reinstall files — REMOVES USER DATA
uninstall: ininstall files — REMOVES USER DATA"
esac
