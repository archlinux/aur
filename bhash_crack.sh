#!/bin/bash
#
# Script created by Pierre Pailleux
# pailleux[dot]pierre[at]gmail[dot]com
#
#  ^                                            ^
# /!\ This script is for TESTING PURPOSES ONLY /!\
# The author is not responsible for any illegal use of this script m'kay !

OK="\033[1;32m"     						# Green     ANSI
KO="\033[1;31m"								# Red       ANSI
WA="\033[1;33m"								# Wellow    ANSI
ST="\033[0;39m"								# No color  ANSI

function _help(){
    echo -e "\
    ${OK}
            This script was created by Pierre Pailleux
                    pailleux.pierre@gmail.com
    ${ST}
    ${WA}
          ^                                            ^
         /!\\ This script is for TESTING PURPOSES ONLY /!\\
    ${ST}
    ${KO}
The author is not responsible for any illegal use of this script m'kay !
    ${ST}

    -f      | -file         :: The output file to use
    -t      | -threads      :: The number of threads to use
    -l      | -lenght       :: Lenght of the passwords used for hash generation
    -c      | -hash         :: The hash to crack
    -x      | -charset      :: The charset in POSIX format
                               Example: \"'[a-Z]''[A-Z]''[0-9]'\" or 'tes!'
                               Use debug option or the script's debug lines to
                               verify charset consistency
    -k      | -algo         :: The type of the hash to crack.
                               Currently supported algirithms are:
                               md5 - sha - sha1 - sha224 - sha256 - sha384 - sha512
    -d      | -debug        :: Debug options, Bash's 'set -x'
    -v      | -version      :: Displays the version of this script
    -h      | -help         :: Displays this help \n"
}

function _version() {
    echo "Version: 1.6"
}

function _crack(){
    while : ; do
        grep ${chash} ${file} 1>/dev/null 2>&1 && exit 0

        # Generate the password and its hash
        pass=`cat /dev/urandom | tr -dc "${charset}" | fold -w ${lenght} | head -n1`
        pass_sha1=`echo $pass | ${algo}sum | awk '{print $1}' | tr '[a-z]' '[A-Z]'`

        # echo -e "${pass}\t\t${pass_sha1}"

        if [ "${pass_sha1}" = "$chash" ] ; then
            echo -e "\n${OK}[+]${ST} Password hash found: \"${pass}\", see output file ;)!" && echo -e "${algo}\t${chash}\t${pass}" >> ${file}
            exit 0
        fi
    done
}

while getopts "f:t:l:c:x:k:vhd" option ; do
	case $option in
        f|file)
            file="${OPTARG}"
            if [ -e ${file} ] ; then
                echo -e "${WA}[-]${ST} File exists, append to file ? [yes/no]"
                read yesno
                if [ "${yesno}" = "no" ] ; then exit 4 ; fi
            fi ;;
        t|threads)
            threads="${OPTARG}"
            `echo ${threads} | grep -E '[A-Za-z]' 1>/dev/null` && echo -e "${KO}[-]${ST} Parameter: ${OPTARG} is not an integer, exiting" && exit 1 ;;
        l|lenght)
            lenght="${OPTARG}" || >&2
            `echo ${lenght} | grep -E '[A-Za-z]' 1>/dev/null` && echo -e "${KO}[-]${ST} Parameter: ${OPTARG} is not an integer, exiting" && exit 1 ;;
        c|hash)
            chash=$(echo ${OPTARG} | tr '[a-z]' '[A-Z]') ;;
        x|charset)
            charset="${OPTARG}" ;;
        k|algo)
            algo="${OPTARG}"
            if [ "${algo}" != "md5" -a "${algo}" != "sha" \
                    -a "${algo}" != "sha1" -a "${algo}" != "sha224" \
                    -a "${algo}" != "sha256" -a "${algo}" != "sha384" \
                    -a "${algo}" != "sha512" ] ; then
                echo -e "${KO}[-]${ST} Algorithm not supported" && exit 4
            fi ;;
        d|debug)
            set -x ;;
        v|version)
            _version
			exit 0 ;;
        h|help)
            _help
            exit 0 ;;
        ?)
            echo -e "${KO}[-]${ST} Invalid option: ${OPTARG}. See -h or -help for correct options"
            _help
            exit 2 ;;
        :)
            echo -e "${KO}[-]${ST} Option: ${OPTARG} requires an argument"
            exit 3 ;;
	esac
done

echo -e "${OK}[+]${ST} Launching ${algo} hash decryption."
grep ${chash} ${file} 1>/dev/null 2>&1 && echo -e "${OK}[+]${ST} Password hash already cracked : `cat ${file} | grep ${chash} | awk '{print $3}'`" && exit 0

for ((i=0;i<=${threads};i++)) ; do
    _crack &
done
