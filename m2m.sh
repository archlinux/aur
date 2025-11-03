#!/bin/bash

norm="\033[1;0m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"

#Making arrangements before executing the script

mkdir -p "$HOME/Music/ytdownloads"
mkdir -p "$HOME/Music/ytdownloads/multi_mode"
mkdir -p "$HOME/.local/m2m_error_log"
YTDIR="$HOME/Music/ytdownloads"
MULTI_DIR="$YTDIR/multi_mode"
ERROR_LOG="$HOME/.local/m2m_error_log"
DATE=$(date +'%a_%b_%d_%H_%M_%S')
LINK=$1
file_name=$2
multiple_switch=false
cwd_switch=false

case $1 in
	-m)	multiple_switch=true;multiple_switch_counter=$2;;
esac

case $3 in 
	--cwd) cwd_switch=true ; cwd_dir=$(pwd) ;;
esac

if [[ true ]]; then
	if [[ $multiple_switch == false && $# -lt 2 ]];then
		echo -e "$red[!] Usage:m2m <universal_resource_locater> <filename.ext> [--cwd]$norm"
		exit 1
	elif [[ $multiple_switch == true && $# -lt 2 ]];then
		echo -e "$red[!] Usage: m2m -m <download_count> [--cwd]$norm"
		echo "For infinite downloads"
		echo -e "$red[!] Usage: m2m -m n [--cwd]$norm"
		exit 1
	fi
fi

multi_dnc(){
	dest_dir=$1
	counter=1
	for file in "${!multiple_download_dict[@]}";do
		url="${multiple_download_dict[$file]}"

		echo -e "$blue[*] Initiating download for stream $counter $norm"
		if [[ $file == "*wav*" ]] || [[ $file == "*mp3*" ]];then
			yt-dlp -f bestaudio $url -o "$dest_dir/ytvideo.webm" 1>/dev/null 2>$ERROR_LOG/$DATE-yt-dlp-multi-download.log
		else
			yt-dlp -f best $url -o "$dest_dir/ytvideo.webm" 1>/dev/null 2>$ERROR_LOG/$DATE-yt-dlp-multi-download.log
		fi
		
		if [[ $? -eq 0 ]];then
	
			echo -e "$green[✓] Stream $counter downloaded $norm"
			echo -e "$blue[*] Converting stream $counter $norm"
			
			if [[ $file == *"wav"* ]] || [[ $file == *"mp3"* ]];then
				ffmpeg -i "$dest_dir/ytvideo.webm" "$dest_dir/$file" 1> /dev/null 2>"$ERROR_LOG/$DATE-ffmpeg-multi-download.log"
			else
				ffmpeg -i "$dest_dir/ytvideo.webm" -map 0:a:0 -map 0:v:0 -c copy "$dest_dir/$file" 1> /dev/null 2>"$ERROR_LOG/$DATE-ffmpeg-multi-download.log"
			fi

			if [[ $? -eq 0  ]];then
				echo -e "$green[✓] Stream $counter saved to filesystem$norm \n"
				rm "$dest_dir"/ytvideo.*
			else
				echo -e "$red[!] An error occured $norm"
				echo -e "$red[!] Error saved at $ERROR_LOG $norm"
				continue
			fi

		else
			echo -e "$red[!] Stream $counter not downloaded $norm"
			echo -e "$red[!] Error saved at $ERROR_LOG $norm \n"
			continue
		fi
		counter=$(($counter+1))	
	done

}

if [[ $multiple_switch != true ]];then

	if [[ $cwd_switch == true ]];then
		dest_dir=$cwd_dir
	else
		dest_dir=$YTDIR
	fi
	echo -e  "$blue[*] Downloading stream from youtube $norm"

	yt-dlp -f best $LINK -o "$dest_dir/ytvideo.webm" 1> /dev/null 2>$ERROR_LOG/$DATE-yt-dlp.log

	#Block telling the user whether the stream was downloaded or not

	if [[ $? -eq 0 ]];then
	
		echo -e "$blue[*] Stream downloaded $norm"
		
		if [[ $cwd_switch == true ]];then
			file_save_location=$cwd_dir
		else
			echo -e "These are the directories in $dest_dir \n$(ls $dest_dir)\nWhere do you want to save this one?"
			read -p ">> " file_save_location
			file_save_location="$dest_dir/$file_save_location"
		fi
	else
		echo -e "$red[!] Stream not downloaded $norm"
		echo -e "$red[!] Error saved at $ERROR_LOG $norm"
		exit 1
	fi
	
	echo -e "$blue[*] Converting the stream...$norm"
	ffmpeg -i "$dest_dir/ytvideo.webm" -map 0:a:0 -map 0:v:0 -c copy "$file_save_location/$file_name" 1> /dev/null 2>"$ERROR_LOG/$DATE-ffmpeg.log"

	#Block telling the user the final action and removing the ghost file.

	if [[ $? -eq 0  ]];then
		rm "$dest_dir"/ytvideo.web*
		echo -e "$green[*] Streams Saved to filesystem at $YTDIR !! $norm" 
	else
		echo -e "$red[!] An error occured $norm"
		echo -e "$red[!] Error saved at $ERROR_LOG $norm"
	fi

fi

if [[ $multiple_switch == true && $multiple_switch_counter != "n" ]];then
	#Taking the multiple links and file names from the user
	declare -A multiple_download_dict

	for((i=1;i<=$multiple_switch_counter;i++));do
	read -p "Enter the URL: " url
	read -p "Enter the name to save it as: " save_file
	multiple_download_dict["$save_file"]="$url"
	done
	
	if [[ $cwd_switch != true ]];then
		multi_dnc "$MULTI_DIR"
	else
		multi_dnc "$cwd_dir"
	fi
fi

if [[ $multiple_switch_counter == "n" ]];then
	declare -A multiple_download_dict
	declare url=""

	while true;do
		read -p "Enter the URL(type 'done' when you are done): " url
		if [[ "$url" == "done" ]];then break; fi
		read -p "Enter the name to save it as: " save_file
		multiple_download_dict["$save_file"]="$url"
	done

	if [[ $cwd_switch != true ]];then
		multi_dnc "$MULTI_DIR"
	else
		multi_dnc "$cwd_dir"
	fi

fi
