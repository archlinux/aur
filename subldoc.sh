#!/bin/sh
dom=${1:-https://www.sublimetext.com}
url=$dom/docs
mkdir -p images
curl -- "$url/" | tee ./index.html | grep -oe 'href *= *"[^"]*"' -e 'src *= *"[^"]*"' | cut -d\" -f2 | grep -ve^http -e^# -eindex.html\$ | 
while read -r i; do
	case $i in
		(/images/*) { curl -- "$url$i">."$i" || rm -- ."$i";}& ;;
		(/download|/support)true&;;
		(/*) { curl -- "$dom$i">./"${i##*/}" || rm -- ./"${i##*/}";}&  ;;
		(*) { curl -- "$url/$i">./"${i##*/}" || rm -- ./"${i##*/}";}& ;;
	esac
	printf %s\\n $! >> wait.pids
done
while read pid; do
	while kill -0 "$pid" 2>/dev/null; do
		sleep 1.5
	done
done < wait.pids
rm wait.pids
for f in *\?v=*; do
	mv -- "$f" "${f%\?v=*}"
done
rm blog download support 2>/dev/null
sed -i -e'
s|href="/"|href="index.html"|
/href="\//s|href="[^"/]*/|href="|
/src="\//s|src="[^"/]*/|src="|
/href=/s|\?v=[0-9a-f]*"|"|
s|href="https://www\.sublimemerge\.com"|href="../sublime-merge/index.html"|
s|href="blog|href="'"$dom"'/blog|
s|href="download|href="'"$dom"'/download|
s|href="support|href="'"$dom"'/support|
' ./*.html
