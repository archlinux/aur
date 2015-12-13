#!/bin/bash 

#
# Control script for ACPI lid state and AC adapter state
#

getXuser() {
        user=`pinky -fw | awk '{ if ($2 == ":'$displaynum'" || $(NF) == ":'$displaynum'" ) { print $1; exit; } }'`
        if [ x"$user" = x"" ]; then
                startx=`pgrep -n startx`
                if [ x"$startx" != x"" ]; then
                        user=`ps -o user --no-headers $startx`
                fi
        fi
        if [ x"$user" != x"" ]; then
                userhome=`getent passwd $user | cut -d: -f6`
                export XAUTHORITY=$userhome/.Xauthority
        else
                export XAUTHORITY=""
        fi
        export XUSER=$user
}

#Find the right XServer to be configured.
getXserver() {
for x in /tmp/.X11-unix/*; do
   displaynum=`echo $x | sed s#/tmp/.X11-unix/X##`
   getXuser;
   if [ x"$XAUTHORITY" != x"" ]; then
       export DISPLAY=":$displaynum"	    
   fi
done
}

#If PPLIB is enabled
checkPPLIB() {
su $user -c '/usr/bin/aticonfig --pplib-cmd="get version"' | grep PPLIB
if [ $? = 0 ]; then
   echo "Has PPLIB"
   has_pplib=1
else
   echo "No PPLIB"
   has_pplib=0
fi
}

case "$1" in
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        getXserver;
                        checkPPLIB;
                        if [ ${has_pplib} -eq 1 ]; then
                            su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc dc"'
                        else
                            su $user -c "/usr/bin/aticonfig --set-powerstate=1 --effective=now"
                        fi
                        ;;
                    00000001)
                        logger 'AC pluged'
                        getXserver;
                        checkPPLIB;
                        if [ ${has_pplib} -eq 1 ]; then
                            su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc ac"'
                        else
                            su $user -c "/usr/bin/aticonfig --set-powerstate=3 --effective=now"
                        fi
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                getXserver;
                checkPPLIB;
                if [ ${has_pplib} -eq 1 ]; then
                    su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc dc"'
                else
                    su $user -c "/usr/bin/aticonfig --set-powerstate=1 --effective=now"
                fi
                ;;
            open)
                logger 'LID opened'
                getXserver;
                checkPPLIB;
                if [ ${has_pplib} -eq 1 ]; then
                    su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc ac"'
                else
                    su $user -c "/usr/bin/aticonfig --set-powerstate=3 --effective=now"
                fi
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
esac