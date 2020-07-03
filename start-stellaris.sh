#!/bin/bash
set -e
set -u


print_help()
{
  echo "usage: stellaris [-l LANGUAGE]"
  echo "supported language: auto de en es fr pl pt ru zh"
  exit 1
}


set_language()
{
  language="error"
  if [ "${1}" = "auto" ]
  then
    language_code="${LANG:0:2}"
    echo "true" > ~/.local/share/Paradox\ Interactive/Stellaris/auto_language
  else
    language_code="${1:0:2}"
    echo "false" > ~/.local/share/Paradox\ Interactive/Stellaris/auto_language
  fi

  test "${language_code}" = "en" && language="l_english"
  test "${language_code}" = "pt" && language="l_braz_por"
  test "${language_code}" = "de" && language="l_german"
  test "${language_code}" = "fr" && language="l_french"
  test "${language_code}" = "es" && language="l_spanish"
  test "${language_code}" = "pl" && language="l_polish"
  test "${language_code}" = "ru" && language="l_russian"
  test "${language_code}" = "zh" && language="l_simp_chinese"

  test "${language_code}" = "error" && test "${1}" != "auto" && echo "ERROR: language ${1} not supported" && print_help
  test "${language_code}" = "error" && language="l_english"
  test -f ~/.local/share/Paradox\ Interactive/Stellaris/settings.txt || echo "language=l_english" > ~/.local/share/Paradox\ Interactive/Stellaris/settings.txt
  sed -i "s/^#*language=.*/language=${language}/g" ~/.local/share/Paradox\ Interactive/Stellaris/settings.txt
}


mkdir -p ~/.local/share/Paradox\ Interactive/Stellaris/
test -f ~/.local/share/Paradox\ Interactive/Stellaris/auto_language || echo "true" > ~/.local/share/Paradox\ Interactive/Stellaris/auto_language
if (( $# > 0 ))
then
  (( $# != 2 )) && print_help
  test "$1" != "-l" && print_help
  set_language ${2}
else
  test $(cat ~/.local/share/Paradox\ Interactive/Stellaris/auto_language) = "true" && set_language auto
fi

/opt/gog-stellaris/stellaris
