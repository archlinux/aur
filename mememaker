#!/bin/bash

usage() {
	echo -e "-h --help			display this message"
	echo -e "-m --meme <file>		create a meme from an image"
	echo -e "-s --split <file1> <file2> 	create a split meme with file1 on top and file2 on bottom"
	echo -e "-t --top <text>		set top text"
	echo -e "-b --bottom <text>		set bottom text"
	echo -e "-o --output <file>		png file for output (left as /tmp/out.png if absent)"
}

create_meme() {
	width="$(identify -format %w /tmp/out.png)"
	height="$(identify -format %h /tmp/out.png)"
	
	letters_per_line="$(($width/16))"
	top="$(echo $top | fold -s -w $letters_per_line)"
	bottom="$(echo $bottom | fold -s -w $letters_per_line)"
	
	[[ -n "$bottom" ]] && convert -font /usr/share/fonts/TTF/impact.ttf -pointsize 35 \
		-background '#0000' -fill white -stroke black -strokewidth 2 \
		-gravity south -size ${width}x${height} label:"$bottom" /tmp/out.png +swap \
		-gravity center -composite  /tmp/out.png
	[[ -n "$top" ]] && convert -font /usr/share/fonts/TTF/impact.ttf -pointsize 35 \
		-background '#0000' -fill white -stroke black -strokewidth 2 \
		-gravity north -size ${width}x${height} label:"$top" /tmp/out.png +swap \
		-gravity center -composite  /tmp/out.png
}

while :
do
	case $1 in
		-h | --help)
			usage
			exit 0;;
		-m | --meme)
			if [[ -n "$2" && "${2:0:1}" != "-" && -f "$2" ]]; then
				convert "$2" -adaptive-resize "600x" /tmp/out.png
				shift 2
			else
				usage
				exit 0
			fi;;
		-s | --split)
			if [[ -n "$2" && "${2:0:1}" != "-" && -f "$2" && -n "$3" && "${3:0:1}" != "-" && -f "$3" ]]; then
				convert -crop 100%x50% "$2" /tmp/"meme_top"%d.png
				convert -crop 100%x50% "$3" /tmp/"meme_bottom"%d.png
				convert -append -adaptive-resize "600x" /tmp/"meme_top"0.png /tmp/"meme_bottom"1.png /tmp/out.png
				rm  /tmp/"meme_top"0.png /tmp/"meme_top"1.png  /tmp/"meme_bottom"0.png /tmp/"meme_bottom"1.png
				shift 3
			else
				usage
				exit 0
			fi;;
		-t | --top)
			if [[ -n "$2" && "${2:0:1}" != "-" ]]; then
				top="$2"
				shift 2
			else
				usage
				exit 0
			fi;;
		-b | --bottom)
			if [[ -n "$2" && "${2:0:1}" != "-" ]]; then
				bottom="$2"
				shift 2
			else
				usage
				exit 0
			fi;;
		-o | --output)
			if [[ -n "$2" && "${2:0:1}" != "-" && -d $(dirname "$2") ]]; then
				outfile="$2"
				shift 2
			else
				usage
				exit 0
			fi;;
		*)
			break;;
	esac
done

[[ -f /tmp/out.png ]] && create_meme
[[ -n "$outfile" ]] && mv /tmp/out.png "$outfile"
