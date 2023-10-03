#!/bin/bash

#~~ Script for PKGBUILD
#~~ Select GUI-language for Veracrypt 1.26.7 and higher (x86_64) Linux
#~~ by Shapiro <shapiro at quantentunnel dot de>
#~~ v1.3

country_codes="ar be bg ca co cs da de el es et eu fa fi fr he hu id it ja ka ko lv my nl nn pl pt-br ro sk sl sv th tr uk uz vi zh-cn zh-hk zh-tw"
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
echo " Enter the country code for your preferred language (i.e. de for German):"
echo ""
echo " 1. Arabic: ar   2. Belarusian: be   3. Bulgarian: bg   4. Catalan: ca   5. Corsican: co"
echo " 6. Czech: cs   7. Danish: da   8. German: de   9. Greek: el   10. English (DEFAULT): en"
echo "11. Spanish: es   12. Estonian: et   13. Basque: eu   14. Persian: fa   15. Finnish: fi"
echo "16. French: fr   17. Hebrew: he   18. Hungarian: hu   19. Indonesian: id   20. Italian: it"
echo "21. Japanese: ja   22. Georgian: ka   23. Korean: ko   24. Latvian: lv   25. Burmese: my"
echo "26. Dutch: nl   27. Norwegian: nn   28. Polish: pl   29. Portuguese/Brazil: pt-br   30. Romanian: ro"
echo "31. Slovak: sk   32. Slovenian: sl   33. Swedish: sv   34. Thai: th   35. Turkish: tr"
echo "36. Ukrainian: uk   37. Uzbek (Cyrillic): uz   38. Vietnamese: vi   39. Chinese (Simplified): zh-cn"
echo "40. Chinese (Hong Kong): zh-hk   41. Chinese (Taiwan): zh-tw"
echo ""
read -p "==> " var
if [[ "$country_codes" == *"$var"* ]]; then
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
	ptbr)
		echo "Language set to: Portuguese/Brazil (ptbr)"
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
	zhcn)
		echo "Language set to: Chinese/Simplified (zh-cn)"
		;;
	zhhk)
		echo "Language set to: Chinese/Hong Kong (zh-hk)"
		;;
	zhtw)
		echo "Language set to: Chinese/Taiwan (zh-tw)"
		;;
	esac
elif [[ "$var" == en ]]; then
		echo "Language set to: English (en)"
else
	echo
	echo "[WARNING] Invalid input. Using default setting."
	echo "[WARNING] Language set to: English (en)"
	echo
fi

