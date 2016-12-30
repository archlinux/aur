#!/bin/sh

CheckedFile="$1"

MD5SUM=`md5sum "$CheckedFile" | awk '{ print $1;}'`
SHA1SUM=`sha1sum "$CheckedFile" | awk '{ print $1;}'`
SHA224SUM=`sha224sum "$CheckedFile" | awk '{ print $1;}'`
SHA256SUM=`sha256sum "$CheckedFile" | awk '{ print $1;}'`
SHA384SUM=`sha384sum "$CheckedFile" | awk '{ print $1;}'`
SHA512SUM=`sha512sum "$CheckedFile" | awk '{ print $1;}'`


      kdialog --yesno "File : $CheckedFile \n md5sum : $MD5SUM\n sha1sum : $SHA1SUM\n sha224 : $SHA224SUM\n sha256 : $SHA256SUM\n sha384 : $SHA384SUM\n sha512 : $SHA512SUM\n\n  Save to file?"

        if [ $? == 0 ];then
		Result=`kdialog --menu "select" md5 md5sum sha1 sha1sum sha224 sha224sum sha256 sha256sum sha384 sha384sum sha512 sha512sum`
		
		if [ $? == 0 ];then
		    case "$Result" in
		        "md5")    echo $MD5SUM    > $CheckedFile".md5" ;;
		        "sha1")   echo $SHA1SUM   > $CheckedFile".sha1" ;;
		        "sha224") echo $SHA224SUM > $CheckedFile".sha224" ;;
		        "sha256") echo $SHA256SUM > $CheckedFile".sha256" ;;
		        "sha384") echo $SHA384SUM > $CheckedFile".sha384" ;;
		        "sha512") echo $SHA512SUM > $CheckedFile".sha512" ;;
		    esac    
		fi
	fi

