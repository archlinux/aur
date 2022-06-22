#!/bin/sh

BRED="\033[1;31m"
BYELLOW='\033[1;93m'
BORANGE='\033[01;38;5;214m'
BGREEN='\033[1;92m'
NOCOLOR='\033[0m'

#Typers
function type {
	sentence=$(echo "$@" | cut -d '|' -f1)
	speed=$(echo "$@" | cut -d '|' -f2)

	len=${#sentence}
	#echo "len: $len"

	pos=0
	while [[ $pos -lt $len ]]; do
		#echo "pos: $pos"
		echo -ne "${sentence:$pos:1}"
		let "pos++"
		sleep $speed
	done
	echo ''
}

function typealive {
	sentence="Still alive."
	speed="0.08"

	len=${#sentence}
	pos=0
	echo -ne "${BRED}"
	while [[ $pos -lt $len ]]; do
		echo -ne "${sentence:$pos:1}"
		let "pos++"
		sleep $speed
	done
	echo -ne "${NOCOLOR}"
}
#Ascii's
function typecake {
echo '             ,   ,   ,   ,             '
echo '           , |_,_|_,_|_,_| ,           '
echo '       _,-=|;  |,  |,  |,  |;=-_       '
echo '     .-_| , | , | , | , | , |  _-.     '
echo '     |:  -|:._|___|___|__.|:=-  :|     '
echo '     ||*:  :    .     .    :  |*||     '
echo '     || |  | *  |  *  |  * |  | ||     '
echo ' _.-=|:*|  |    |     |    |  |*:|=-._ '
echo "-    \`._:  | *  |  *  |  * |  :_.'    -"
echo ' =_      -=:.___:_____|___.: =-     _= '
echo '    - . _ __ ___  ___  ___ __ _ . -    '
}

function typegun {
echo ' +--^----------,--------,-----,--------^-,'
echo " | |||||||||   \`--------'     |          O"
echo ' \`+---------------------------^----------|'
echo "   \`\\_,---------,---------,--------------'"
echo "     / XXXXXX /'|       /'                "
echo "    / XXXXXX /  \`\\    /'                  "
echo "   / XXXXXX /\`-------'                    "
echo '  / XXXXXX /                              '
echo ' / XXXXXX /                               '
echo '(________(                                '
echo ' \`------'
}

function typebh {
echo '_____________________________________¶¶___________'
echo '________________________________¶1¶1111111¶_______'
echo '________¶¶111¶_______________¶¶¶¶111111111¶¶¶1____'
echo '_____¶1¶¶¶¶¶111111¶_________¶¶¶1¶¶¶11111111¶1¶¶___'
echo '___¶¶¶1¶1111111111¶¶1______¶¶1¶¶¶1111111111111¶¶__'
echo '__¶¶1¶¶1111111111111¶¶_____¶¶¶1¶¶¶¶1111111111111¶_'
echo '__¶¶_¶1111111111111111¶¶___¶¶¶¶¶¶11¶111111111111¶_'
echo '_11_¶11111111111111111¶¶_____¶¶¶¶__¶111111111111¶¶'
echo '¶¶¶¶1111111111111111¶¶¶¶_____1¶¶__11111111111111¶¶'
echo '¶¶¶¶11111111111¶¶¶¶¶¶¶______1¶1¶¶1111111111111111¶'
echo '¶¶1¶1111111111111¶¶¶¶¶¶_____¶¶¶¶¶¶11111111111111¶¶'
echo '¶¶11111111111111111111111¶¶___¶¶¶¶¶¶1111111111¶¶¶_'
echo '_1¶111111111111111111¶¶¶¶¶¶____¶¶¶¶11111111111¶1__'
echo '__¶¶11111111111111111¶¶¶_____¶¶¶1111111111111¶1___'
echo '___¶¶¶111111111111¶1¶¶¶____1¶¶111¶1111111¶11¶1____'
echo '____1¶¶¶11111111111¶¶¶¶111¶¶¶¶111111111¶11¶¶¶_____'
echo '______¶¶¶¶1111111111111¶¶¶¶1¶¶¶¶¶¶¶¶11¶11¶¶_______'
echo '_______¶¶¶¶¶11111111111¶111¶___¶¶¶111¶1¶¶¶________'
echo '_________¶¶¶¶¶¶111111111111¶__¶¶¶111¶¶¶1__________'
echo '____________1¶¶¶¶¶11111111¶¶_¶¶¶¶111¶¶____________'
echo '______________¶¶¶¶¶¶¶1111111_¶¶¶11¶¶1_____________'
echo '_________________1¶¶¶¶¶¶1111¶¶¶1¶¶¶¶______________'
echo '____________________¶¶¶¶¶¶1¶¶¶¶¶1¶________________'
echo '_______________________¶1¶¶¶1¶¶¶__________________'
echo '___________________________11¶____________________'
}

function typesk {
echo '          uuuuuuu                          '
echo '             uu$$$$$$$$$$$uu               '
echo '          uu$$$$$$$$$$$$$$$$$uu            '
echo '         u$$$$$$$$$$$$$$$$$$$$$u           '
echo '        u$$$$$$$$$$$$$$$$$$$$$$$u          '
echo '       u$$$$$$$$$$$$$$$$$$$$$$$$$u         '
echo '       u$$$$$$$$$$$$$$$$$$$$$$$$$u         '
echo '       u$$$$$$"   "$$$"   "$$$$$$u         '
echo '       "$$$$"      u$u       $$$$"         '
echo '        $$$u       u$u       u$$$          '
echo '        $$$u      u$$$u      u$$$          '
echo '         "$$$$uu$$$   $$$uu$$$$"           '
echo '          "$$$$$$$"   "$$$$$$$"            '
echo '            u$$$$$$$u$$$$$$$u              '
echo '             u$"$"$"$"$"$"$u               '
echo '  uuu        $$u$ $ $ $ $u$$       uuu     '
echo ' u$$$$        $$$$$u$u$u$$$       u$$$$    '
echo '  $$$$$uu      "$$$$$$$$$"     uu$$$$$$    '
echo 'u$$$$$$$$$$$uu    """""    uuuu$$$$$$$$$$  '
echo '$$$$"""$$$$$$$$$$uuu   uu$$$$$$$$$"""$$$"  '
echo ' """      ""$$$$$$$$$$$uu ""$"""           '
echo '           uuuu ""$$$$$$$$$$uuu            '
echo '  u$$$uuu$$$$$$$$$uu ""$$$$$$$$$$$uuu$$$   '
echo '  $$$$$$$$$$""""           ""$$$$$$$$$$$"  '
echo '   "$$$$$"                      ""$$$$""   '
echo '     $$$"                         $$$$"    '
}

function typeexpl {
echo "     _.-^^---....,,--        "
echo " _--                  --_    "
echo '<                        >)  '
echo '|                         |  '
echo ' \._                   _./   '
echo "    \`\`\`--. . , ; .--'''      "
echo "          | |   |            "
echo "       .-=||  | |=-.         "
echo "       \`-=#$%&%$#=-'         "
echo '          | ;  :|            '
echo " _____.,-#%&$@%#&#~,._____   "
}

function typebm {
echo '           .-;+$XHHHHHHX$+;-.            '
echo '        ,;X@@X%/;=----=:/%X@@X/,         '
echo '      =$@@%=.              .=+H@X:       '
echo '    -XMX:                      =XMX=     '
echo '   /@@:                          =H@+    '
echo '  %@X,                            .$@$   '
echo ' +@X.                               $@%  '
echo '-@@,                                .@@= '
echo '%@%                                  +@$ '
echo 'H@:                                  :@H '
echo 'H@:         :HHHHHHHHHHHHHHHHHHX,    =@H '
echo '%@%         ;@M@@@@@@@@@@@@@@@@@H-   +@$ '
echo '=@@,        :@@@@@@@@@@@@@@@@@@@@@= .@@: '
echo ' +@X        :@@@@@@@@@@@@@@@M@@@@@@:%@%  '
echo '  $@$,      ;@@@@@@@@@@@@@@@@@M@@@@@@$.  '
echo '   +@@HHHHHHH@@@@@@@@@@@@@@@@@@@@@@@+    '
echo '    =X@@@@@@@@@@@@@@@@@@@@@@@@@@@@X=     '
echo '      :$@@@@@@@@@@@@@@@@@@@M@@@@$:       '
echo '        ,;$@@@@@@@@@@@@@@@@@@X/-         '
echo '           .-;+$XXHHHHHX$+;-.            '
}

#Prereqs & Preparation
echo -e "${BYELLOW}DEBUG: Checkin needed binaries...${NOCOLOR}"
which mplayer || exit 2
which yt-dlp || exit 2
echo -e "${BGREEN}DEBUG: You have all the binaries you need!...${NOCOLOR}"

if ! [ -f /var/cache/stillalive/Portal_-_Still_Alive.mp3 ]; then
	echo -e "${BYELLOW}DEBUG: Caching music in local folder...${NOCOLOR}"
	yt-dlp --extract-audio --audio-format mp3 --restrict-filenames -o "/var/cache/stillalive/%(title)s.%(ext)s" https://www.youtube.com/watch?v=Y6ljFaKRTrI
else
	echo -e "${BGREEN}DEBUG: Coolio: music is already cached!${NOCOLOR}"
fi

echo -e "${BORANGE}MUSIC: Still Alive from at the end of Portal during the credits, by Jonathan Coulton: http://www.jonathancoulton.com, Owned by Valve Corporation.${NOCOLOR}"

mplayer /var/cache/stillalive/Portal_-_Still_Alive.mp3 >/dev/null 2>/dev/null &

type "Test Assesment Report|0.2"
type "Subject 5646548-1337-EGGZ|0.1"
type "Loading data..|0.05"
type "This was a triumph|0.15"
type "       |0.2"
type "I'm making a note here:|0.11"
echo -ne "${BGREEN}"
type "HUGE SUCCESS|0.15"
echo -ne "${NOCOLOR}"
type "   |0.2"
type "It's hard to overstate my satisfaction!|0.17"
type " |0.22"
type "Apperture science.|0.2"
type "   |0.2"
type "We do what we must.|0.07"
type "...|0.1"
type "Because|0.1"
type "...|0.1"
type "We can.|0.1"
type "      |0.3"
type "For the good of all of us.|0.12"
echo -ne "${BRED}"
type "Except the ones who are dead|0.07"
echo -ne "${NOCOLOR}"
type " |0.3"
type "But there's no sense crying over every mistake|0.1"
type "You just keep on trying till you run out of|0.07" #cake
typecake
type " |0.05"
type "And the Science gets done|0.1"
type "And you make a neat|0.09" #gun
typegun
type "For the people who are|0.09" #still alive
typealive
type "                 |0.4"
type "I'm not even angry.|0.1"
type "         |0.2"
type "I'm being so sincere right now.|0.15"
type "     |0.2"
type "Even though you|0.12" #Broke my heart
typebh
type ".. And|0.32" #Killed me
typesk
type "           |0.2"
type "And tore me to pieces|0.1"
type "          |0.2"
type "And threw every piece|0.1"
type "into .. a|0.1" #A fire
typeexpl
type "           |0.2"
type "As they burned it hurt because...|0.1"
echo -ne "${BGREEN}"
type "I was so happy for you!|0.05"
echo -ne "${NOCOLOR}"
type "      |0.2"
type "Now these points of data|0.1"
type "Make a beatiful line.|0.08"
type "And we're out of beta|0.07"
type "We're releasing on time!|0.08"
type "So I'm GLaD. I got burned.|0.09"
type "Think of all the things we learned.|0.09"
type "For the people who are.|0.06"
typealive
type "           |0.4"
type "One last thing:|0.05"
type "    |0.4"
type "Go ahead and leave me.|0.1"
type "       |0.2"
type "I think I prefer to stay inside.|0.1"
type "      |0.2"
type "Maybe you'll find someone else to help you..|0.1"
type "            |0.2"
type "Maybe |0.1" #Black Mesa
typebm
type "         |0.4"
echo -ne "${BYELLOW}"
type "THAT WAS A JOKE. FAT CHANCE.|0.1"
echo -ne "${NOCOLOR}"
type "     |0.4"
type "Anyway, this|0.1"
typecake
type "Is great.. It's so delicious and moist....|0.1"
type "Look at me still talking when there's science to do.|0.09"
type "When I look out there,|0.06"
echo -ne "${BRED}"
type "it makes me GLaD I'm not you.|0.1"
echo -ne "${NOCOLOR}"
type "I've experiments to run, there is research to be done, on the people who are|0.085"
typealive
echo""
type "PS: And believe me I am|0.1"
typealive
echo ""
type "PPS: I'm doing Science and I'm|0.1"
typealive
echo ""
echo -ne "${BGREEN}"
type "PPPS:I feel fantastic|0.1"
echo -ne "${NOCOLOR}"
type "And I'm|0.1"
typealive
echo ""
type "FINAL THOUGHT:|0.04"
type "While you're|0.1"
echo -ne "${BRED}"
type "dying|0.1"
echo -ne "${NOCOLOR}"
type "I'll be|0.1"
typealive
echo ""
type "FINAL THOUGHT PS:|0.04"
type "And when you're|0.1"
echo -ne "${BRED}"
type "dead|0.1"
echo -ne "${NOCOLOR}"
type "I will be|0.1"
typealive
echo ""
type "  |0.4"
typealive
type "...|0.4"
typealive
echo ""
