# Set path to mycroft bindirs if they exist

[ -d /usr/share/mycroft-core/bin ] && setenv PATH ${PATH}:/usr/share/mycroft-core/bin
[ -d /usr/share/mycroft-core ] && setenv PATH ${PATH}:/usr/share/mycroft-core
