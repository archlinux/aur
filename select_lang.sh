#!/bin/sh

#~~ Script for PKGBUILD 
#~~ Select GUI-language for Veracrypt 1.25.7 (x86_64) Linux
#~~ by Shapiro <shapiro@quantentunnel.de>
#~~ v1.0

country_codes="ar be bg ca cs da de el es et eu fa fi fr he hu id it ja ka ko lv my nl nn pl pt-br ro ru sk sl sv th tr uk uz vi zh-cn zh-hk zh-tw"

echo "Enter the country code for your preferred language (i.e. de for German):"
echo " 1. Arabic (ar)   2. Belarusian (be)   3. Bulgarian (bg)   4. Catalan (ca)   5. Czech (cs)"
echo " 6. Danish (da)   7. German (de)   8. Greek (el)   9. Spanish (es)   10. Estonian (et)"
echo "11. Basque (eu)   12. Persian (fa)   13. Finnish (fi)   14. French (fr)   15. Hebrew (he)"
echo "16. Hungarian (hu)   17. Indonesian (id)   18. Italian (it)   19. Japanese (ja)   20. Georgian (ka)"
echo "21. Korean (ko)   22. Latvian (lv)   23. Burmese (my)   24. Dutch (nl)   25. Norwegian (nn)"
echo "26. Polish (pl)   27. Portuguese/Brazil (pt-br)   28. Romanian (ro)   29. Russian (ru)   30. Slovak (sk)"
echo "31. Slovenian (sl)   32. Swedish (sv)   33. Thai (th)   34. Turkish (tr)   35. Ukrainian (uk)"
echo "36. Uzbek/Cyrillic (uz)   37. Vietnamese (vi)   38. Chinese/Simplified (zh-cn)"
echo "39. Chinese/Hong Kong (zh-hk)   40. Chinese/Taiwan (zh-tw)   41. English (en) [DEFAULT]"

read -p "==> " var
if [[ "$country_codes" == *"$var"* ]]; then
	cp "./Translations/Language.$var.xml" "./src/Common/Language.xml"
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
	ru)
		echo "Language set to: Russian (ru)"
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
		echo "Language set to: Chinese/Simplified (zhcn)"
		;;
	zhhk)
		echo "Language set to: Chinese/Hong Kong (zhhk)"
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

