#!/bin/bash

no_format="\033[0m"
bold="\033[1m"
green="\033[38;5;158m"
red="\033[38;5;203m"

cat <<"EOF"
           _ _                 _
      __ _(_) |_   _ __   __ _(_)_ __
     / _` | | __| | '_ \ / _` | | '__|
    | (_| | | |_  | |_) | (_| | | |
     \__, |_|\__| | .__/ \__,_|_|_|
     |___/        |_|

EOF

filename="developers.txt"

if [ ! -f $filename ]; then
    touch developers.txt
fi

mapfile -t devmap < $filename

printf "${bold}${red}>>> Developers${no_format}\n\n"

# Display developers
printf "\t${bold}${red}[-]${no_format}: ${green}None${no_format}\n"
for entry in "${!devmap[@]}"; do
    printf "\t${bold}${red}[$entry]${no_format}: ${green}${devmap[$entry]}${no_format}\n"
done

printf "\n"

# Read Author
index=""
prompt="\[$red\]Select Author \[$green\](0, 1 ... n): \[$no_format\]"
while read -ep "${prompt@P}" -r index && [[ ! $index =~ ^[0-9]$ ]]
do
    :;
done

author=${devmap[$index]}

# Read Co-author
printf "${red}Select Co-author: ${no_format}"
read -r index
if [[ -n "$index" ]] && [ "$index" != "-" ]; then
    co_author=${devmap[$index]}; 
fi


# TODO: Do something with this data.
printf "\nAuthor: ${author}\n"
if [ -v co_author ]; then
    echo "Co-authored-by: ${co_author}" 
fi

