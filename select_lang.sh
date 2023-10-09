#!/bin/bash

#~~ Script for PKGBUILD
#~~ Select GUI-language for Veracrypt 1.26.7 and higher Linux
#~~ by Shapiro <shapiro at quantentunnel dot de>
#~~ v1.5: Automatic language selection depending on system locale.

country_codes="ar be bg ca co cs da de el es et eu fa fi fr he hu id it ja ka ko lv my nl nn pl ro sk sl sv th tr uk uz vi"
country_codes2="pt_BR zh_CN zh_HK zh_TW"
clear
echo ""
echo '____   ____                  _________                        __'
echo '\   \ /   /________________  \_   ___ \_______ ___.__._______/  |_'
echo ' \   Y   // __ \_  __ \__  \ /    \  \/\_  __ <   |  |\____ \   __\'
echo '  \     /\  ___/|  | \// __ \\     \____|  | \/\___  ||  |_> >  |  '
echo '   \___/  \___  >__|  (____  /\______  /|__|   / ____||   __/|__|'
echo '              \/           \/        \/        \/     |__|'
echo '         _                            _'
echo '        (_)_ _    _  _ ___ _  _ _ _  | |__ _ _ _  __ _ _  _ __ _ __ _ ___'
echo '        | | ` \  | || / _ \ || | `_| | / _` | ` \/ _` | || / _` / _` / -_)'
echo '        |_|_||_|  \_, \___/\_,_|_|   |_\__,_|_||_\__, |\_,_\__,_\__, \___|'
echo '                  |__/                           |___/          |___/'
echo ""
echo ""
echo "Currently over 40 languages are available. The GUI of the compiled VeraCrypt"
echo "will be set to your system locale, if it is supported."
echo "Detecting locale..."
var=$(locale | grep LANG | cut -d= -f2 | cut -d. -f1)
if [[ "$country_codes2" == *"$var"* ]]; then
	if [[ $var == "pt_BR" ]]; then
		var="pt-br"
		echo "Language set to: Portuguese/Brazil (pt_BR)"
	elif [[ $var == "zh_CN" ]]; then
		var="zh-cn"
		echo "Language set to: Chinese/Simplified (zh_CN)"
	elif [[ $var == "zh_HK" ]]; then
		var="zh-hk"
		echo "Language set to: Chinese/Hong Kong (zh_HK)"	
	elif [[ $var == "zh_TW" ]]; then
		var="zh-tw"
		echo "Language set to: Chinese/Taiwan (zh_TW)"
	cp "./VeraCrypt_1.26.7/Translations/Language.$var.xml" "./VeraCrypt_1.26.7/src/Common/Language.xml"
	fi
else
	var=$(echo $var | cut -d_ -f1)
	cp "./VeraCrypt_1.26.7/Translations/Language.$var.xml" "./VeraCrypt_1.26.7/src/Common/Language.xml"
	case "$var" in
	ar)
		echo "Language set to: Arabic (ar)"
		;;
	be)
		echo "Language set to: Belarusian (be)"
		;;
	bg)
		echo "Language set to: Bulgarian (bg)"
		;;
	ca)
		echo "Language set to: Catalan (ca)"
		;;
	co)
		echo "Language set to: Corsican (co)"
		;;
	cs)
		echo "Language set to: Czech (cs)"
		;;
	da)
		echo "Language set to: Danish (da)"
		;;
	de)
		echo "Language set to: German (de)"
		;;
	el)
		echo "Language set to: Greek (el)"
		;;
	es)
		echo "Language set to: Spanish (es)"
		;;
	et)
		echo "Language set to: Estonian (et)"
		;;
	eu)
		echo "Language set to: Basque (eu)"
		;;
	fa)
		echo "Language set to: Persian (fa)"
		;;
	fi)
		echo "Language set to: Finnish (fi)"
		;;
	fr)
		echo "Language set to: French (fr)"
		;;
	he)
		echo "Language set to: Hebrew (he)"
		;;
	hu)
		echo "Language set to: Hungarian (hu)"
		;;
	id)
		echo "Language set to: Indonesian (id)"
		;;
	it)
		echo "Language set to: Italian (it)"
		;;
	ja)
		echo "Language set to: Japanese (ja)"
		;;
	ka)
		echo "Language set to: Georgian (ka)"
		;;
	ko)
		echo "Language set to: Korean (ko)"
		;;
	lv)
		echo "Language set to: Latvian (lv)"
		;;
	my)
		echo "Language set to: Burmese (my)"
		;;
	nl)
		echo "Language set to: Dutch (nl)"
		;;
	nn)
		echo "Language set to: Norwegian (nn)"
		;;
	pl)
		echo "Language set to: Polish (pl)"
		;;
	ro)
		echo "Language set to: Romanian (ro)"
		;;
	sk)
		echo "Language set to: Slovak (sk)"
		;;
	sl)
		echo "Language set to: Slovenian (sl)"
		;;
	sv)
		echo "Language set to: Swedish (sv)"
		;;
	th)
		echo "Language set to: Thai (th)"
		;;
	tr)
		echo "Language set to: Turkish (tr)"
		;;
	uk)
		echo "Language set to: Ukrainian (uk)"
		;;
	uz)
		echo "Language set to: Uzbek/Cyrillic (uz)"
		;;
	vi)
		echo "Language set to: Vietnamese (vi)"
		;;
	esac
fi

