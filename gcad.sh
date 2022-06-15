#!/bin/bash

#
#HCCAD startup script
#
#EXTEND_LIB_PATH="/usr/lib"

Package_Name="com.gstarcad2022.cad"
Version="v2022"
Languge="zh-cn"

Env_User_Data=${XDG_DATA_HOME-"$HOME/.local/share"}

export Env_User_Data=${Env_User_Data}/${Package_Name}

input_method_framework=fcitx
is_exist_fcitx=`ps -ef | grep [f]citx`

if [ -z "$is_exist_fcitx" ] ; then
	input_method_framework=ibus
fi


export XMODIFIERS=@im=${input_method_framework}

export XIM=${input_method_framework}  

export XIM_PROGRAM=${input_method_framework}  

export GTK_IM_MODULE=${input_method_framework}  

export QT_IM_MODULE=${input_method_framework}

export QT_QPA_PLATFORM=xcb

CAD_RUN_PATH=/opt/gstarcad
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${CAD_RUN_PATH}/drivers":/usr/lib/gstarcad	

#$BINARY
"${CAD_RUN_PATH}/gcad" "$1"

