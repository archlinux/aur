#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
BLUE='\033[0;34m'
BROWN='\033[0;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

phrases=("haaaaaaaa"
"I am so drunk right now"
"Mail that to me son"
"So unfair"
"🐷"
"I am such a good trivia player"
" \o/"
"Hey feral boy"
"Come play my trivia: /j #trivia"
"How can I user my computer?"
"I need more Romanians here"
"We should have a threesome on skype some day"
"I love romanians girls, we need to bring some more here"
"Help me with this girl"
"$(whoami) \o/"
"tell us more, son"
"I am so busy right now"
"I am so busy today"
"I am too busy"
"I am soooooo drunk right now"
"I could make that but would take months"
"Bash is the best programming language and the only I need"
"I don't know how to use my computer"
"$(whoami), come to my office"
"$(whoami): Help me, without public humiliation"
"$(whoami): I need some help"
"$(whoami): I need some help with a bash script"
"Is this file '$(ls | head -1)' really needed?"
"# rm -rf $(ls | head -1)'"
"boom!"
"Hey feral boy, what is that command again?"
"Sorry but I can't see that, I'm not on X11 right now"
"Having my second brandy of the day"
"Men, let's get on Skype"
"oooh! I will record that on an audiocassette for my show!"
"$(whoami): Can i interview you?"
"it reminds me of something I saw on Family Guy"
"Guys have you met my new girlfriend Straffeny?"
"hey $(whoami) you should come to #trivia more often"
"my new girlfriend keeps coming here and going to the lobby"
"Olá gurizinho, vamos falar português cara"
"Buna $(whoami)!"
)

echo -e "$BROWN" 
figlet GASCONHEART | lolcat
echo -e "$RED------------------------------------------------------------------------------$NC"
echo -e "$WHITE irc.dot.org.es $NC"
echo -e "$BLUE port: $GREEN 6667 $NC"
echo -e "$BLUE port: $GREEN 6697 $RED ssl $NC"
echo -e "$BLUE tor:  $GREEN chatdotju32g5swnixwnqzgpsytc4umjfdqmkv2xt52lfw4on2rccmyd.onion $NC"
echo -e "$RED------------------------------------------------------------------------------$NC"
echo

echo -e "${BROWN}Featured Messages from gasconheart: $NC"

finalize (){
  exit 0
}

trap finalize INT

echophrase() {
  size=${#phrases[@]}
  index=$((RANDOM % size))
  phrase=$(pidof Xorg >/dev/null && echo "${phrases[$index]}" || echo "Sorry, I'm not on X11 right now")
  echo -n "                                                                                          "
  echo -ne "\r"
  echo -en "${PURPLE} --> "
  if ! command -v lolcat &> /dev/null
  then
    echo "$phrase"
  else
    printf '%s\n' "$phrase" | (lolcat -a -d 60 || exit 0)
  fi
}

i=0
printf "\n\n\n\n\n\n\n\n\n"
echo -e "$BROWN                                              Ctrl + C to exit $NC"
up=$(tput cuu1); printf %s "$up$up$up$up"
while true
do
  if [ $((i % 4)) -eq 0 ]
  then
    up=$(tput cuu1); printf %s "$up$up$up$up"
  fi
  echophrase
  i=$((i + 1))
done
