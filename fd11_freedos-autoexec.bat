@echo off
path z:\bin;z:\dosemu
set NLS=z:\nls
set HELPPATH=z:\help
set TEMP=c:\tmp
blaster
prompt $P$G
unix -s DOSDRIVE_D
if "%DOSDRIVE_D%" == "" goto nodrived
lredir d: linux\fs%DOSDRIVE_D% r
:nodrived
rem uncomment to load another bitmap font
rem loadhi display con=(vga,437,2)
rem mode con codepage prepare=((850) z:\cpi\ega.cpx)
rem mode con codepage select 850
rem chcp 850
unix -s DOSEMU_VERSION
echo "Welcome to dosemu %DOSEMU_VERSION%!"
unix -e
