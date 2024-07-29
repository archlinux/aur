#!/bin/bash

if [ $# -eq 0 ]; then

	export CUR_PATH=$(dirname $(readlink -f ${BASH_SOURCE}))
   	# echo 当前运行目录：/opt/cn.i4Tools
	cd /opt/cn.i4Tools
	export LD_LIBRARY_PATH=/opt/cn.i4Tools/lib:$LD_LIBRARY_PATH
	export QT_AUTO_SCREEN_SCALE_FACTOR=0
	export QT_XCB_GL_INTEGRATION=none
   	/opt/cn.i4Tools/i4Tools
   
else
    	export PID_USBMUX=$1
    	export mycommand=$2
   
    	kill -9 $PID_USBMUX
    	shift 1
    	remaining_args=()

	for (( i=2; i<=$#; i++ )); do
    		remaining_args+=("${!i}")
	done

	# echo "Executing command with arguments: $mycommand ${remaining_args[*]}"
	$mycommand "${remaining_args[@]}"	
fi
