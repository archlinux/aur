#!/bin/bash
/opt/clonk_rage/clonk $*

if [ $? == 126 ]; then
  message="You must be in the group 'games' to play Clonk Rage."
  zenity --info --text "${message}" ||
  kdialog --msgbox "${message}" ||
  xmessage -buttons okay -default okay "${message}"
fi
