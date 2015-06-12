#!/bin/bash

# imagej.sh - a not so simple wrapper script used to run ImageJ
#
#   Copyright 2008 Paolo Ariano
#   Authors: Paolo Ariano (paolo dot ariano at unito dot it)
#   Last modified date: 19 Sept 2008
#
# This is a not so simple wrapper script used to run ImageJ in Unix but 
# optimized for Debian GNU/Linux, this is a merge between my original script 
# and a more exhaustive one from Jon Jackson (jjackson at familyjackson dot net)

# Adapted for use with ArchLinux

#   Edited 2009 Giulio Guzzinati
#   Authors: Giulio Guzzinati (guzzinati.giulio at gmail)
#   Last modified date: 24 May 2009

#   Edited 2012/13 Michael Schubert
#   Authors: Michael Schubert (mschu.dev at gmail)
#   Last modified date: 17 Feb 2013

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public Licenseas published by
# the Free Software Foundation, either version 3 of the License, or (at 
# your option) any later version. See the file Documentation/LGPL3 in the
# original distribution for details. There is ABSOLUTELY NO warranty.
# This program is free software, but comes with no warrenty or guarantee
# send bug reports or feedback to me or to debian bug tracking system


# setup environment
# dont give error for unset variables (matters for environment variables)
set +u
# allow extended pattern matching
shopt -s extglob

##################### CREATE THE RIGHT ENVIRONMENT #####################

# ImageJ path
ij_path=/usr/share/imagej

#ImageJ user path
ij_user_path=$HOME/.imagej

# Documentation URL
doc_url='http://rsb.info.nih.gov/ij/'

# temp folder
ij_tmp='/tmp/imagej'

# default behaviour when an ImageJ window is already open
newwindow='true'
#newwindow='false'

# macro argument conjoining character
separator=':'
# a ' ' may work provided no arguments would contain spaces
# use macro functions:  args=getArgument(); argArray=split(args, ':'); 
# to recover macro arguments

# create plugins,macro,tmp dirs 
mkdir -p ${ij_user_path}/{plugins,macros,luts}

# makes symbolik links from shared plugins, macros and luts 
find ${ij_path}/{plugins,macros,luts} -maxdepth 1 -mindepth 1 | while read p; do
    if [ ! -e "${p/$ij_path/$ij_user_path}" ] ; then
        ln -s "$p" "${p/$ij_path/$ij_user_path}"
    fi
done

# remove symlinks for files that do no longer exist
find ${ij_user_path} -type l | while read p; do
    if ! readlink -qe "$p" > /dev/null; then 
        rm "$p"
    fi
done

# report errors to this user
# ijadmin='paolo.ariano@unito.it'

# other variables 
dir=`pwd`
user=`whoami`
host=`hostname`
if [[ -z "$DISPLAY" ]] ; then
    echo 'Display variable not set'
    echo 'If ImageJ fails to load, try '
    echo '% setenv DISPLAY yourcomputer:0'
    echo 'if you use the "csh" or for "bash" try'
    echo '% export DISPLAY=yourcomputer:0'
    display='default' 
else
    display="$DISPLAY"
fi

declare -i port=0
declare -i verbosity=0
images=''
macrocmd=''
macroargs=''

############ DEFAULT MEMORY SETTINGS  #########################

declare -i default_mem=768
declare -i min_mem=32
declare -i max_32bit=1800 # empirical
declare -i max_64bit=17000000000 # conservative

############ MEMORY ALLOCATION #########################

OS=$(uname)
processor=$(uname -m) # -p doesn't work on debian/ubuntu
declare -i mem
declare -i max_mem
declare -i free_mem

java_home="${java_home:-$JAVA_HOME}"

if [[ "$OS" == 'SunOS' ]] ; then
    java_arch='-d64'
    JAVA_HOME="${java_home_SunOS:-$java_home}"  
    max_mem=`vmstat | awk 'BEGIN{maxMem='$max_64bit'} NR == 3 {fmem=int($5 / 1024); if (fmem < maxMem) {print fmem} else {print maxMem}}'`
    free_mem="max_mem"
    mem=${free_mem}/2
    if (( $mem > $default_mem || $mem < $min_mem )) ; then mem=$default_mem ; fi
elif [[ "$OS" == 'Linux' ]] ; then
    if [[ "$processor" == 'x86_64' ]] ; then
        java_arch='-d64'
        JAVA_HOME="${java_home_Linux_x86_64:-$java_home}"
        max_mem=`free | awk -v maxMem=$max_64bit 'NR == 2 {fmem=int($2 / 1024); if (fmem < maxMem) {print fmem} else {print maxMem}}'`
        free_mem=`free | awk -v maxMem=$max_64bit 'NR == 3 {fmem=int($4 / 1024); if (fmem < maxMem) {print fmem} else {print maxMem}}'`
        mem=${free_mem}/3*2
        if (( $mem > $default_mem || $mem < $min_mem )) ; then mem=$default_mem ; fi
    else
        java_arch='-d32'
        JAVA_HOME="${java_home_Linux:-$java_home}"
        max_mem=`free | awk -v maxMem=$max_32bit 'NR == 2 {fmem=int($2 / 1024); if (fmem < maxMem) {print fmem} else {print maxMem}}'`
        free_mem=`free | awk -v maxMem=$max_32bit 'NR == 3 {fmem=int($4 / 1024); if (fmem < maxMem) {print fmem} else {print maxMem}}'`
        mem=${free_mem}/3*2
        if (( $mem > $default_mem || $mem < $min_mem )) ; then mem=$default_mem ; fi    
    fi
fi


##################### USAGE DESCRIPTION #####################

function usage {
    echo 
    echo 'Image display and analysis program. Opens formats including:'
    echo 'UNC, Analyze, Dicom, NIFTI, Tiff, Jpeg, Gif, PNG ...'  
    echo
    echo 'imagej [options] image [ image2 ... image3 ]'
    echo '    -h        print help and more options'
    echo '    -o        open images in an open ImageJ panel'
    echo '    -p <N>    open images in ImageJ panel number <N>' 
    echo "    -x <MB>   set available memory (default=${mem} max=${max_mem})"     
    echo 
}

function fullusage {
    echo 
    echo 'Image display and analysis program. Opens formats including:'
    echo 'UNC, Analyze, Dicom, NIFTI, Tiff, Jpeg, Gif, PNG ...'  
    echo 
    echo 'imagej [options] image [ image2 ... image3 ] -> open images'
    echo
    echo 'basic options:'
    echo '  -h        print help and more options'
    echo '  -o        open images in existing ImageJ panel if one exists'
    echo '  -p <N>    open images in existing ImageJ panel number <N>' 
    echo "  -x <MB>   set available memory (default=${mem} max=${max_mem})"
    echo
    echo 'advanced options:'
    echo '  -c        enable plugin compilation within imagej'
    echo '  -d        use development version'
    echo '  -v        be verbose (vv or vvv increases verbosity)'  
    echo
    echo 'options for batch processing:'
    echo "  -e 'Macro Code'            execute macro code"
    echo "  -r 'Menu Command'          run menu command"
    echo "Quotation marks '' are required around commands including spaces"
    echo 'Commands can be sent to open ImageJ panels with the -p option'
    echo 
    echo 'options for macros:'
    echo 'imagej [-i image] [-b|-m] [arg1 ... argN] '
    echo '  -b macro    run macro without graphics window' 
    echo '  -m macro    run macro' 
    echo '"image" will be opened before macro is run'
    echo 'all following arguments are passed to macro'        
    echo 
    echo "Documentation - $doc_url "
    echo "Report problems with this software to $ijadmin"
    echo
}

function macroCmdError {
    fullusage 
    echo 'Only one command option (-b -e -m OR -r) may be specified' 1>&2
    exit 1
}

function getFullPath {
    # Return full path to file
    # treats multiple arguments as a single file with spaces
    if (( $# == 0 )) ; then
        echo "error getting full path for '${*}'" 1>&2
    fi
    pwd_getFullPath="$PWD"
    \cd $(dirname "${*}") > /dev/null
    dir_getFullPath="$PWD"
    \cd "$pwd_getFullPath" > /dev/null
    echo "$dir_getFullPath"/$(basename "${*}")
}
function derefln { 
    # Returns the full path of file to which link points
    # following multiple levels of symbolic links.
    # NOTE: if you use this function in a script, don't use any
    # of the variable names used here
    if (( $# == 0 )) ; then
        return
    fi
    local the_link="$1"
    local link_dir 
    local current_dir="$PWD"
    while file "$the_link" | grep symbolic > /dev/null ; do # resolve links until target is regular file
        if [[ "$the_link" == */* ]] ; then # path contains  /
            \cd $(dirname "${the_link}") > /dev/null
            the_link=$(basename "$the_link")
        fi
        link_dir="$PWD" 
        # some versions of 'file' surround the path in `' quotes, hence the tr to remove them
        the_link=$(file "${the_link}" | awk '/symbolic link/ {print $NF}' | tr -d "\140\047" )
        if [[ "$the_link" != /* ]] ; then # path is not absolute path  - make it one
            the_link="$link_dir/$the_link"
        fi
        \cd "$current_dir" > /dev/null
    done 
    echo $the_link
}


# The best way to install .jar libraries required by plugins is to copy them 
# to the imagej plugins/jars directory
# Alternatively, either copy them to ${ij_path}/jre/lib/ext/ or add the .jar
# filepath to the modules line below. Paths are separated by a colon
# Classpath must follow command line arguments, as ij_path is dependent on the -d option

# Resolving ij.jar path.  If ij.jar is a symbolic link to ij_<version>.jar
# this allows updating ij.jar without crashing running sessions
ij_jar_path=$(derefln ${ij_path}/ij.jar)    
                                         
for mod_jar in ${ij_path}/lib/*jar  ; do
    modules="${modules:-}${modules+:}$mod_jar"
done
modules="-cp ${ij_jar_path}:${modules+:}${modules:-}"
#${ij_path}/plugins/jars/dcmie.jar

export LD_LIBRARY_PATH="${ij_path}/lib/${OS}_$processor"
if (( $verbosity > 0 )) ; then
    echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
fi
 
# enable plugins to be compiled in imagej
tools="$JAVA_HOME/lib/tools.jar"


#####################  ARGUMENTS PARSING #####################

while getopts b:cde:hi:m:nop:r:vx: options
do
    case $options in
        b)  if [[ -n "$macrocmd" ]] ; then macroCmdError ; fi
            macrocmd="-batch ${OPTARG}"
            ;;
        c)  modules="${modules:-}${modules+:}${tools}"
            ;;
        d)  ij_path="$ij_path_dev"
            ;;
        e)  if [[ -n "$macrocmd" ]] ; then macroCmdError ; fi
            macrocmd='-eval'
            macroargs="'${OPTARG}'"
            ;;
        h)  fullusage
            exit 0
            ;;
        i)  images="${images}'${OPTARG}' "
            ;;
        m)  if [[ -n "$macrocmd" ]] ; then macroCmdError ; fi
            macrocmd="-macro ${OPTARG}"
            ;;
        n)  newwindow='true'
            ;;
        o)  newwindow='false'
            ;;
        p)  newwindow='false'
            port="${OPTARG}"
            if (( "$port" < 1 || "$port" > 99 )) ; then
                echo "${OPTARG} is not a permissible value for port number (-p)" 1>&2
                exit 1
            fi
            ;;
        r)  if [[ -n "$macrocmd" ]] ; then macroCmdError ; fi
            macrocmd='-run'
            macroargs="'${OPTARG}'"
            ;;
        v)  verbosity=verbosity+1
            if (( $verbosity == 2 )) ; then set -x ; fi
            if (( $verbosity == 3 )) ; then set -v ; fi
            ;;
        x)  mem="${OPTARG}"
            newwindow='true'
            if (( $mem < $min_mem || $mem > $max_mem )) ; then
                echo "${OPTARG} is not a permissible value for memory (-x)" 1>&2
                echo "min=${min_mem}, max=${max_mem}" 1>&2
                exit 1              
            fi
            ;;
        \?) usage
            exit 1 
            ;;
    esac
done
            
        
declare -i i=1
while (( i < $OPTIND )) ; do
    shift
    i=i+1
done

#if (( "$#" == 0 )) ; then
#   usage
#fi 

# -b and -m options only:
# remaining command line arguments are passed as macro arguments 
# separated by $separator
if [[ -n "$macrocmd" && -z "$macroargs" ]] ; then
    while (( "$#" > 0 )) ; do
        if [[ -z "$macroargs" ]] ; then 
            macroargs="${1}"
        else
            macroargs="${macroargs}${separator}${1}"
        fi
        shift       
    done
    macroargs="'$macroargs'"
fi
    
# PROTECT POSSIBLE SPACES IN IMAGE FILENAMES
if (( "$#" > 0 )) ; then
    while (( "$#" > 0 )) ; do
        filearg="${1}"
        # full file path required when sending images to running ImageJ panel
        if [[ "${newwindow}" == 'false' && -f "${filearg}" ]]  && ! expr "${filearg}" : '/.*' > /dev/null; then 
            filearg="$(getFullPath ${filearg})"
        fi
        images="${images}'$filearg' "
        shift 
    done
fi  

##################### USING PORT #####################

# CREATE IMAGEJ SOCKET-LOCK DIRECTORY IF NON EXISTANT 
if [[ ! -d "$ij_tmp" ]] ; then
    mkdir "$ij_tmp"
    chmod 777 "$ij_tmp"
fi

# CREATE IMAGEJ LOG FILE IF NON EXISTANT 
if [[ -n "$ij_log" && ! -f "$ij_log" ]] ; then
    touch "$ij_log"
    chmod 666 "$ij_log"
fi

# CREATES A TEMP FILE INDICATING A PORT IS IN USE BY IMAGEJ
cd "$ij_tmp"
declare -i count=1
portopen='false'
lockFileCreated='false'
declare -a locklist=(`ls | grep '[0-9][0-9]-.*'`)

[[ -n "$ij_log" ]] && echo -e "$$\t$(date)\tNew Window = $newwindow" >> "$ij_log" 2> /dev/null
[[ -n "$ij_log" ]] && echo -e "$$\t$(date)\tPort = $port" >> "$ij_log" 2> /dev/null
[[ -n "$ij_log" ]] && echo -e "$$\t$(date)\tlocklist: \n ${locklist[*]}" >> "$ij_log" 2> /dev/null
if (( $verbosity > 0 )) ; then echo -e "locklist: \n ${locklist[*]}" ; fi

# PORT SPECIFIED BY USER
if (( $port > 0 )) ; then
    # look for a lock on the port specified
    for lockname in ${locklist[*]} ; do
        prefix=`printf '%02u' $port`
        if [[ "$lockname" == ${prefix}-${user}-${host}* ]] ; then
            # found lock on the requested port, owned by user on current display
            portopen='true'
            if (( $verbosity > 0 )) ; then echo "Using socket lock: $lockname" ; fi
            count=$port
            break
        elif [[ "$lockname" == ${prefix}-* ]] ; then
            echo "Port $port is in use by some other user or a different host" 1>&2
            if (( $verbosity > 0 )) ; then echo "Port lock: $lockname" ; fi
            exit 1
        fi
    done 
    # specified port not in use 
    count=$port

# IF EXISTING WINDOW IS REQUESTED, LOOK FOR LISTENING PORT
elif [[ "$newwindow" == 'false' && ${#locklist} != 0 ]] ; then
    # look for a lock on the current display for this user
    for lockname in ${locklist[*]} ; do
        if [[ "$lockname" == [0-9][0-9]-${user}-${host}-${display} ]] ; then
            portopen='true'
            if (( $verbosity > 0 )) ; then echo "Found socket lock: $lockname" ; fi
            # if a matching user/display is found, use this one
            count="${lockname%-*-*-*}"
            #count=`echo $lockname | sed  -e 's/^\([0-9][0-9]\).*/\1/' -e 's/^0//'` # csh?
            break
        fi
    done
fi

# IF A NEW PORT IS TO BE USED
if [[ "$portopen" == 'false' ]] ; then
    # new window requested or no matching port found
    # if port is not specified, look for first free port
    if (( "$port" == 0 )) ; then 
        if (( ${#locklist} == 0 )) ; then
            # no active locks - use first port
            count=1
        else
            # active locks - check each port number so see if it is in use
            # this is not synchronised!!
            count=0
            inuse='true'
            while [[ "$inuse" == 'true' ]] ; do
                count=count+1
                prefix=`printf '%02u' $count`
                inuse='false'
                for lockname in ${locklist[*]} ; do
                    if [[ "$lockname" == ${prefix}-* ]] ; then
                        inuse='true'
                    fi
                done
            done
        fi
    fi
    # CREATING A NEW PORT LOCK
    prefix=`printf '%02u' $count`
    lockname=${prefix}-${user}-${host}-${display}
    
    [[ -n "$ij_log" ]] && echo -e "$$\t$(date)\tCreating lock\t$lockname" >> "$ij_log" 2> /dev/null
    if (( $verbosity > 0 )) ; then echo -n "creating lock $lockname ... " ; fi
    touch $lockname
    trap '\rm -f ${ij_tmp}/$lockname >/dev/null ; echo -e "$$\t$(date)\tReleasing lock\t$lockname" >> "$ij_log" 2> /dev/null' EXIT TERM KILL 
    # Quitting ImageJ sends EXIT, as does a kill/kill -9 
    # CTRL+C in terminal sends INT + EXIT
    # System shutdown sends TERM (+EXIT??)
    
    if (( $verbosity > 0 )) ; then  echo 'done' ; fi

    lockFileCreated='true'
    if [[ -z "$macrocmd" ]] ; then 
        echo 'Open other images in this ImageJ panel as follows:'
        echo "  imagej -p $count <image1> [<image2> ... <imageN>]"
    fi
    [[ -n "$ij_log" ]] && echo -e "$$\t$(date)\tSocket lock:\t$lockname" >> "$ij_log" 2> /dev/null
    if (( $verbosity > 0 )) ; then echo "Socket lock: $lockname" ; fi
    echo
fi

##################### FINALLY RUN IMAGEJ #####################

eval java ${java_arch} -mx${mem}m ${modules} ij.ImageJ -ijpath ${ij_user_path} -port${count} ${images} ${macrocmd} ${macroargs}

exit 0

