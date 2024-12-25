#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Linking /home/artem/HTMLBUILDER/htmlbuilder
OFS=$IFS
IFS="
"
/usr/bin/ld -b elf64-x86-64 -m elf_x86_64  --dynamic-linker=/lib64/ld-linux-x86-64.so.2     -L. -o /home/artem/HTMLBUILDER/htmlbuilder -T /home/artem/HTMLBUILDER/link84734.res -e _start
if [ $? != 0 ]; then DoExitLink /home/artem/HTMLBUILDER/htmlbuilder; fi
IFS=$OFS
echo Linking /home/artem/HTMLBUILDER/htmlbuilder
OFS=$IFS
IFS="
"
/usr/bin/objcopy --only-keep-debug /home/artem/HTMLBUILDER/htmlbuilder /home/artem/HTMLBUILDER/htmlbuilder.dbg
if [ $? != 0 ]; then DoExitLink /home/artem/HTMLBUILDER/htmlbuilder; fi
IFS=$OFS
echo Linking /home/artem/HTMLBUILDER/htmlbuilder
OFS=$IFS
IFS="
"
/usr/bin/objcopy "--add-gnu-debuglink=/home/artem/HTMLBUILDER/htmlbuilder.dbg" /home/artem/HTMLBUILDER/htmlbuilder
if [ $? != 0 ]; then DoExitLink /home/artem/HTMLBUILDER/htmlbuilder; fi
IFS=$OFS
echo Linking /home/artem/HTMLBUILDER/htmlbuilder
OFS=$IFS
IFS="
"
/usr/bin/strip --strip-unneeded /home/artem/HTMLBUILDER/htmlbuilder
if [ $? != 0 ]; then DoExitLink /home/artem/HTMLBUILDER/htmlbuilder; fi
IFS=$OFS
