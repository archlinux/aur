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
"👴??🖥"
"I am such a good trivia player"
" \o/"
"Hey feral boy"
"Come play my trivia: /j #trivia"
"How can I user my computer?"
"I need more Romanians here"
"We should have a threesome on skype some day"
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
"hey $(whoami) you should come to #trivia more often"
"Olá gurizinho, vamos falar português cara"
"Buna $(whoami)!"
"Hello this is gasconheart"
)

echo -e "$BROWN" 
figlet GASCONHEART | lolcat
echo -e "$RED------------------------------------------------------------------------------$NC"
echo -e "$WHITE irc.dot.org.es $NC"
echo -e "$BLUE port: $GREEN 6667 $NC"
echo -e "$BLUE port: $GREEN 6697 $RED ssl $NC"
echo -e "$BLUE tor:  $GREEN chatdotju32g5swnixwnqzgpsytc4umjfdqmkv2xt52lfw4on2rccmyd.onion $NC"
echo -e "$RED------------------------------------------------------------------------------$NC"
(echo -e "HIT$RED ENTER$NC TO CHAT WITH US" | lolcat -p 50)
echo
echo -e "${BROWN}Featured Messages from gasconheart: $NC"


echophrase() {
  size=${#phrases[@]}
  index=$((RANDOM % size))
  if [[ $OSTYPE == 'darwin'* ]]
  then
    phrase=${phrases[$index]}
  else
    phrase=$(pidof Xorg >/dev/null && echo "${phrases[$index]}" || echo "Sorry, I'm not on X11 right now")
  fi
  echo -n "                                                                                          "
  echo -ne "\r"
  echo -en "${PURPLE} --> "
  if ! command -v lolcat &> /dev/null
  then
    echo "$phrase"
    sleep 3
  else
    printf '%s\n' "$phrase" | (lolcat -a -d 60 || exit 0)
  fi
}

i=0
printf "\n\n\n\n\n\n\n\n"
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
done &
child_pid=$!

finalize (){
  kill -9 $child_pid
  exit 0
}

trap finalize INT

wait_input () {
  if read -r
  then
    if [[ $OSTYPE == 'darwin'* ]]
    then
      open "irc://irc.dot.org.es:+6697/romanian" &
      disown %1
    else
      xdg-open "irc://irc.dot.org.es:+6697/romanian" &
      disown %1
    fi
    finalize
  fi
  sleep 0.1
}
while true; do wait_input; done
