#!/bin/bash

TRANSLATE='
s|*| gwiazdka |g
s|/| slesz |g
s|\\| bekslesz |g
s|-| minus |g
s|+| plus |g
s|(|w nawiasie: |g
s|)| koniec nawiasu|g
s|\[|w nawiasie kawu: |g
s|\]| koniec nawiasu|g
s|{|w klamrze: |g
s|}| koniec klamry|g
s|ó|u|g
s|Ó|U|g
s|ą|o~|g
s|Ą|O~|g
s|ć|c~|g
s|Ć|C~|g
s|ę|e~|g
s|Ę|E~|g
s|ł|l/|g
s|Ł|L/|g
s|ń|n~|g
s|Ń|N~|g
s|ś|s~|g
s|Ś|S~|g
s|ź|z~|g
s|Ż|Z~|g
s|ż|z*|g
s|Ź|Z*|g
'

test -f "$HOME/.festival-pl.rc" && . "$HOME/.festival-pl.rc"

VERSION="0.2"
YEARS="2009, 2012"

usage() {
cat <<EOF
festival-pl (konwerter) - wersja $VERSION (c) 3ED $YEARS GPL3

Użycie:
  festival-pl [-h|--help|--help-festival|--help-translate]
  festival-pl [--translate] "Łąka zimną porą"
  echo "Łąka zimną porą" | festival-pl [--translate]

Opcje:
  --translate       poprawiony tekst zostanie wypisany na
                    stdout i nie zostanie poddany syntezie
  --help-festival   pomoc na temat konfiguracji festival
  --help-translate  pomoc na temat modyfikacji bazy translate
  --help, -h        ten ekran pomocy

Licancja:
  Moduł głosu wydany jest jako darmowy dla niekomercyjnych zastosowań.
  Ten skrypt (\`festival-pl') jest objęty zasadami licencji GPL3.

Więcej na temat cstr_pl_em_diphone (głosu) znajdziesz tutaj:
  /usr/share/festival/voices/polish/cstr_pl_em_diphone/README
  /usr/share/festival/voices/polish/cstr_pl_em_diphone/przeczytajto.txt
EOF
exit
}

usage_translate() {
  cat >&2 <<EOF
--------------------------------------------------------------------
Baza \`translate' to zmienna w formacie wyrażeń regularnych programu
sed (powinna być w apostrofach), który podmienia znaki na takie,
które \`festival' potrafi rozpoznać. Możesz utworzyć bliźniaczą
bazę w swoim katalogu domowym wykonująć polecenie:

    festival-pl --help-translate > ~/.festival-pl.rc
--------------------------------------------------------------------

EOF
  cat <<EOF
#
# To jest obecnie używana baza \`TRANSLATE' dla \`festival-pl'
#
TRANSLATE='$TRANSLATE'
EOF
exit
}
usage_festival() {
  cat <<EOF
Aby ustawić polski głos jako domyślny:
  a) edytuj plik: /usr/share/festival/voices.scm
  b) wyszukaj linijkę: defvar default-voice-priority-list
  c) do listy dopisz: cstr_pl_em_diphone

Przykład:
...
 (defvar default-voice-priority-list 
-  '(kal_diphone
+  '(cstr_pl_em_diphone
+    kal_diphone
     cmu_us_bdl_arctic_hts
...
EOF
exit
}

error() {
  test -n "$1" && printf "\e[31;1mBŁĄÐ:\e[0m %s\n" "$1"
  exit 1
}

translate() {
  echo "$SAYTEXT" | sed "$TRANSLATE"
  test "$?" -gt "0" && error "Baza translate nie jest poprawna.."
}
saytext() {
  cat | festival --tts
  test "$?" -gt "0" && error "Program festival zakończył błędem.."
}

ONLY_TRANSLATE="0"
SAYTEXT=""

until [ "$#" -le "0" ]; do
  case "$1" in
	  -h|--help) usage;;
    --help-festival) usage_festival;;
    --help-translate) usage_translate;;
    --translate) ONLY_TRANSLATE="1";;
  	*) SAYTEXT+="$1 ";;
  esac
  shift
done

#if [ "`uname -s`" = "Linux" ]; then
  test -e "/dev/dsp" || error "Brak pliku: \`/dev/dsp', załaduj moduł: \`snd_pcm_oss'"
#fi

test -n "$SAYTEXT" || SAYTEXT="`cat`"

if [ "$ONLY_TRANSLATE" = "1" ]; then
  translate
else
  translate | saytext
fi
