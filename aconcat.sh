#!/usr/bin/env bash

tmp_dir=$(mktemp -d)
out_tmp_dir=$(mktemp -d)

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
BLUE='\033[0;34m'
BROWN='\033[0;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

help() {
  echo
  echo -e "     ${BLUE}AUDIO CONCATENATOR$NC"
  echo -e "Merge audios into a single file."
  echo -e "This is just a shell script ffmpeg concat wrapper"
  echo
  echo -e "${GREEN}Usage:$NC $0 ${GREEN}-i$NC ${PURPLE}<input1.file>$NC ${GREEN}-i$NC ${PURPLE}<input2.file>$NC ${GREEN}-i$NC ${PURPLE}<input3.file>$NC ... ${GREEN}-o$NC ${PURPLE}<output.file>$NC"
  echo -e "${GREEN}Usage:$NC $0 ${GREEN}-o$NC ${PURPLE}<output.file>$NC ${PURPLE}*.mp3$NC"
}

input_files=()
output_file=""
while getopts "hi::o:" opt
do
  case "${opt}" in
    \?)
        echo -e "${RED}Invalid option or missing argument: $OPTARG${NC}"
        echo
        help
        exit 1
        ;;
    h)
        help
        exit 0
        ;;
    i) 
        input_files+=("$OPTARG")
        ;;
    o)
        output_file="$OPTARG"
        ;;
  esac
done

shift $(($OPTIND - 1))
for arg in "$@"; do
  input_files+=("$arg")
done

# for val in "${input_files[@]}"
# do
#   echo input $val
# done
# echo output $output_file
# exit


if [[ -z $input_files ]] || [[ -z $output_file ]]; then
  echo -e "${RED}Arguments -i and -o are required$NC"
  help
  exit 1
fi

for i in "${input_files[@]}"
do 
  ffmpeg -y -i "$i" "$tmp_dir/$i.wav";
done


ls "$tmp_dir"/*.wav > "$tmp_dir"/list.txt
sed -i 's/^/file /' "$tmp_dir"/list.txt
ffmpeg -y -f concat -safe 0 -i "$tmp_dir"/list.txt -c copy "$out_tmp_dir"/output.wav
ffmpeg -y -i "$out_tmp_dir"/output.wav "$output_file"

rm -rf "$tmp_dir"
rm -rf "$out_tmp_dir"
