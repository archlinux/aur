#!/bin/sh
#    Copyright (C) 2011 Canonical Ltd.
#
#    Authors: Scott Moser <smoser@canonical.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# the fudge factor. if its within this many 512 byte sectors, dont bother
FUDGE=${GROWPART_FUDGE:-$((20*1024))}
TEMP_D=""
RESTORE_FROM=""
VERBOSITY=0
DISK=""

error() { echo "$@" 1>&2; }
fail() { [ $# -eq 0 ] || echo "FAILED:" "$@"; exit 1; }
nochange() { echo "NOCHANGE:" "$@"; exit 0; }
changed() { echo "CHANGED:" "$@"; exit 0; }
cleanup() {
	if [ -n "${RESTORE_FROM}" ]; then
		error "***** WARNING: Resize failed, attempting to revert ******"
		if sfdisk --no-reread "${DISK}" ${CHS} -I "${RESTORE_FROM}"; then
			error "***** Appears to have gone OK ****"
		else
			error "***** FAILED! or original partition table looked like: ****"
			cat "${RESTORE_HUMAN}" 1>&2
		fi
	fi
	[ -z "${TEMP_D}" -o ! -d "${TEMP_D}" ] || rm -Rf "${TEMP_D}"
}
debug() {
	local level=${1}; shift;
	[ "${level}" -gt "${VERBOSITY}" ] && return
	error "${@}"
}
mktemp_d() {
	# just a mktemp -d that doens't need mktemp if its not there.
	_RET=$(mktemp -d "${TMPDIR:-/tmp}/${0##*/}.XXXXXX" 2>/dev/null) && return
	_RET=$(umask 077 && t="${TMPDIR:-/tmp}/${0##*/}.$$" && mkdir "${t}" &&
		echo "${t}")
	return
}

Usage() {
	cat <<EOF
${0##*/} disk partition
   rewrite partition table so that partition takes up all the space it can
   options:
    -h | --help      print Usage an exit
         --fudge F   if part could be resized, but change would be
                     less than 'F', do not resize (default: ${FUDGE})
    -N | --dry-run   only report what would be done, show new 'sfdisk -d'
    -v | --verbose   increase verbosity / debug

   Example:
    - ${0##*/} /dev/sda 1
      Resize partition 1 on /dev/sda
EOF
}
bad_Usage() { Usage 1>&2; error "$@"; exit 1; }

#short_opts="hNv"
#long_opts="help,dry-run,fudge:,verbose"
#getopt_out=$(getopt --name "${0##*/}" \
#	--options "${short_opts}" --long "${long_opts}" -- "$@") &&
#	eval set -- "${getopt_out}" ||
#	bad_Usage

dry_run=0
fudge=${FUDGE}
disk=""
part=""
while [ $# -ne 0 ]; do
	cur=${1}; next=${2};
	case "$cur" in
		-h|--help) Usage; exit 0;;
		   --fudge) fudge=${next}; shift;;
		   --dry-run) dry_run=1;;
		-v|--verbose) VERBOSITY=$(($VERBOSITY+1));;
		--) shift; break;;
		-*) fail "unknown option ${cur}";;
		*) 
			if [ -z "${disk}" ]; then
				disk=${cur};
			else
				[ -z "${part}" ] || fail "confused by arg ${cur}"
				part=${cur};
			fi
			;;
	esac
	shift;
done

[ -n "${disk}" ] || bad_Usage "must supply disk and partition-number"
[ -n "${part}" ] || bad_Usage "must supply partition-number"

[ -e "${disk}" ] || { fail "${disk}: does not exist"; }

[ "${part#*[!0-9]}" = "${part}" ] || fail "partition-number must be a number"

mktemp_d && TEMP_D="${_RET}" || fail "failed to make temp dir"
trap cleanup 0

change_out=${TEMP_D}/change.out
dump_out=${TEMP_D}/dump.out
new_out=${TEMP_D}/new.out
dump_mod=${TEMP_D}/dump.mod
tmp="${TEMP_D}/tmp.out"
err="${TEMP_D}/err.out"
orig_bin="${TEMP_D}/orig.save"
RESTORE_HUMAN="${TEMP_D}/recovery"

# --show-pt-geometry outputs something like
#     /dev/sda: 164352 cylinders, 4 heads, 32 sectors/track
sfdisk "${disk}" --show-pt-geometry > "${tmp}" 2>"${err}" &&
	read _devc cyl _word1 heads _word2 sectors _word3 < "${tmp}" &&
	CHS="-C $cyl -H $heads -S $sectors" ||
	fail "failed to get CHS from ${disk}"

tot=$((${cyl}*${heads}*${sectors}))

debug 1 "geometry is $CHS. total size=${tot}"
sfdisk ${CHS} -uS -d "${disk}" > "${dump_out}" 2>"${err}" ||
	fail "failed to dump sfdisk info for ${disk}"

{
echo "## sfdisk ${CHS} -uS -d ${disk}"; 
cat "${dump_out}"
}  > "${RESTORE_HUMAN}"
[ $? -eq 0 ] || fail "failed to save sfdisk -d output"

sed -e 's/,//g; s/start=/start /; s/size=/size /' "${dump_out}" > "${dump_mod}"

dpart="${disk}${part}" # disk and partition number
if [ -b "${disk}p${part}" -a "${disk%[0-9]}" != "${disk}" ]; then
	# for block devices that end in a number (/dev/nbd0)
	# the partition is "<name>p<partition_number>" (/dev/nbd0p1)
	dpart="${disk}p${part}"
elif [ "${disk#/dev/loop[0-9]}" != "${disk}" ]; then
	# for /dev/loop devices, sfdisk output will be <name>p<number> format
	# also, even though there is not a device there.
	dpart="${disk}p${part}"
fi

pt_start=$(awk '$1 == pt { print $4 }' "pt=${dpart}" < "${dump_mod}") &&
	pt_size=$(awk '$1 == pt { print $6 }' "pt=${dpart}" < "${dump_mod}") &&
	[ -n "${pt_start}" -a -n "${pt_size}" ] &&
	pt_end=$((${pt_size}+${pt_start})) ||
		fail "failed to get start and end for ${dpart} in ${disk}"

# find the minimal starting location that is >= pt_end 
max_end=$(awk '
	$3 == "start" { if($4 >= pt_end && $4 < min) { min = $4 } }
	END { printf("%s\n",min); }' \
	min=${tot} pt_end=${pt_end} "${dump_mod}") &&
	[ -n "${max_end}" ] ||
	fail "failed to get max_end for partition ${part}"

debug 1 "max_end=${max_end} tot=${tot} pt_end=${pt_end} pt_start=${pt_start} pt_size=${pt_size}"
[ $((${pt_end})) -eq ${max_end} ] &&
	nochange "partition ${part} is size ${pt_size}. it cannot be grown"
[ $((${pt_end}+${fudge})) -gt ${max_end} ] &&
	nochange "partition ${part} could only be grown by $((${max_end}-${pt_end})) [fudge=${fudge}]"

# now, change the size for this partition in ${dump_out} to be the
# new size
new_size=$((${max_end}-${pt_start}))
sed "\|^${dpart} |s/${pt_size},/${new_size},/" "${dump_out}" > "${new_out}" ||
	fail "failed to change size in output"

change_info="partition=${part} start=${pt_start} old: size=${pt_size} end=${pt_end} new: size=${new_size},end=${max_end}"
if [ $dry_run -ne 0 ]; then
	echo "CHANGE: ${change_info}"
	{
	echo "# === old sfdisk -d ==="
	cat "${dump_out}"
	echo "# === new sfdisk -d ==="
	cat "${new_out}"
	} 1>&2
	exit 0
fi

sfdisk --no-reread "${disk}" ${CHS} --force -O "${orig_bin}" \
	< "${new_out}" > "${change_out}" 2>&1 || {
	DISK=${disk}; RESTORE_FROM="${orig_bin}";
	error "attempt to resize ${disk} failed. sfdisk output below:"
	sed 's,^,| ,' "${change_out}" 1>&2
	fail "failed to resize"
}
changed "${change_info}"

# dump_out looks something like:
## partition table of /tmp/out.img
#unit: sectors
#
#/tmp/out.img1 : start=        1, size=    48194, Id=83
#/tmp/out.img2 : start=    48195, size=   963900, Id=83
#/tmp/out.img3 : start=  1012095, size=   305235, Id=82
#/tmp/out.img4 : start=  1317330, size=   771120, Id= 5
#/tmp/out.img5 : start=  1317331, size=   642599, Id=83
#/tmp/out.img6 : start=  1959931, size=    48194, Id=83
#/tmp/out.img7 : start=  2008126, size=    80324, Id=83

# vi: ts=4 noexpandtab
