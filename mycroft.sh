# Set path to mycroft bindirs if they exist
export PATH=${PATH}:/usr/share/mycroft-core/bin

[ -d /usr/share/mycroft-core/bin ] && append_path '/usr/share/mycroft-core/bin'
[ -d /usr/share/mycroft-core ] && append_path '/usr/share/mycroft-core'
export PATH
