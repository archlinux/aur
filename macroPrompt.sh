#!/bin/sh

macroDir=~/.config/xmacro
if [ ! -d ${macroDir} ];then
	mkdir -p ${macrodir}
fi

echo "Which macro button should this be assigned to? [1-5]"
read macroNumber

fileName=macro${macroNumber}.rec

xmacrorec2 -o ${macroDir}/${fileName}


