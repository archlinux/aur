#!/bin/bash

_srb2()
{
	local soptions="-opengl -connect -mousegrab -bandwidth
				-bindaddr -clientport -config -compress
				-consisdump -console -coopsound -debug
				-debugfile -dedicated -extratic -framebuffer
				-freq -gametype -gettickcount -height -home
				-internetserver -ipx -maxdemo -noblit -nodigimusic
				-nodinput -nodownload -nodownloading -nodraw
				-noendtxt -noerror -nofiles -nojoy -nomidimusic
				-nomouse -nomusic -nosound -openal -packetsize
				-password -playdemo -precachesound -record
				-resetdata -room -server -silent -sounddriver
				-timedemo -timetic -udpport -ultimatemode -usecd
				-voodoo -warp -width -win -winmidi"
	local moptions="-file"

	local cur=`_get_cword`
	local prev="${COMP_WORDS[COMP_CWORD-1]}"

	case "$prev" in
		"-room")
			COMPREPLY=(33 28)
			;;
		"-gametype")
			COMPREPLY=(0 1 2 3 4)
			;;
		"-file" | "-config" | "-home")
			_filedir
			;;
		"-connect")
			if [[ -e "/usr/bin/xclip" ]]; then
				addr="`xclip -out`"
				if [[ "$addr" == *.*.*.* ]]; then
					:
				else
					addr=
				fi
			fi
			COMPREPLY=($addr)
			;;
		*)
			if [[ "$cur" == -* ]]; then
				COMPREPLY=($(compgen -W "$soptions $moptions" -- "$cur"))
				cw=""
				for ((i=1; i < ${#COMP_WORDS[@]}-1; i++)); do
					for sopt in $soptions; do
						if [[ "$sopt" == "${COMP_WORDS[i]}" ]]; then
							for r in ${!COMPREPLY[@]}; do
								if [[ "$sopt" == "${COMPREPLY[r]}" ]]; then
									unset 'COMPREPLY[r]'
									break
								fi
							done
					fi
					done
				done
			else
				for ((i=${#COMP_WORDS[@]}-1; i >= 0; i--)); do
					if [[ "${COMP_WORDS[i]}" == -* ]]; then
						if [[ "${COMP_WORDS[i]}" == "-file" ]]; then
							_filedir
							return
						else
							return
						fi
					fi
				done

				COMPREPLY=()
			fi
			;;
	esac
}

complete $filenames -F _srb2 srb2
