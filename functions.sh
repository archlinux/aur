function get_cmdline(){
	for i in $(</proc/cmdline)
	do	case "$i" in
			"${1}"=*)
				echo "${i//${1}=}"
				return 0
			;;
		esac
	done
	return 1
}
function ewrite(){
	local content="${1}"
	shift
	for file in "${@}"
	do	if [ -f "${file}" ]
		then	echo "${content}" > "${file}"
			break
		fi
	done
}
