#!/bin/bash

curl -s https://api.github.com/repos/fseoane/pynotify/releases/latest \
| grep "pyNotify.*_Arch_amd64.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -O pyNotify.zip -qi  -


#now we'´'ll have a file called pyNotify.zip containing all the packages
unzip pyNotify.zip -d temp
mv temp/$(ls temp)  pyNotify
rm -rf temp
