#!/bin/bash 

#
# Control script for ACPI lid state and AC adapter state
#

getXuser() {
#       user=`finger| grep -m1 ":$displaynum " | awk '{print $1}'`
#       if [ x"$user" = x"" ]; then
#               user=`finger| grep -m1 ":$displaynum" | awk '{print $1}'`
#       fi
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
}


grep -q closed /proc/acpi/button/lid/*/state
if [ $? = 0 ]; then
 lid_closed=1
 echo "Lid Closed"
else
 lid_closed=0
 echo "Lid Open"
fi

#grep -q off-line /proc/acpi/ac_adapter/*/state 
grep -q 0 /sys/class/power_supply/ADP*/online

if [ $? = 0 ]; then
   echo "On DC"
   on_dc=1
else
   echo "On AC"
   on_dc=0
fi

#Find the right XServer to be configured.
for x in /tmp/.X11-unix/*; do
   displaynum=`echo $x | sed s#/tmp/.X11-unix/X##`
   getXuser;
   if [ x"$XAUTHORITY" != x"" ]; then
       export DISPLAY=":$displaynum"	    
   fi
done

#If PPLIB is enabled
su $user -c '/usr/bin/aticonfig --pplib-cmd="get version"' | grep PPLIB
if [ $? = 0 ]; then
   echo "Has PPLIB"
   has_pplib=1
else
   echo "No PPLIB"
   has_pplib=0
fi



if [ ${lid_closed} -eq 1 -o ${on_dc} -eq 1 ]; then
    echo "Low power"
    if [ ${has_pplib} -eq 1 ]; then
        su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc dc"'
    else
        su $user -c "/usr/bin/aticonfig --set-powerstate=1 --effective=now"
    fi
else
    echo "high power"
    if [ ${has_pplib} -eq 1 ]; then
        su $user -c '/usr/bin/aticonfig --pplib-cmd="notify psrc ac"'
    else
        su $user -c "/usr/bin/aticonfig --set-powerstate=3 --effective=now"
    fi
fi