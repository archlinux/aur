#!/bin/sh

# Copyright 2025 Tim Hildering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

trap rollback EXIT INT TERM

opts_add_replace() {
	opts="$1"
	opt1="$2"
	opt2="$3"
	avail=n
	ret=

	oldIFS="$IFS"
	IFS=","

	for opt in $opts; do
		if [ "x$opt" = "x$opt2" ] || [ "x$opt" = "x$opt1"  ]; then
			if [ "$avail" = "n" ]; then
				ret="${ret:+${ret},}${opt1}"
			fi

			avail=y
		else
			ret="${ret:+${ret},}${opt}"
		fi
	done

	IFS="$oldIFS"

	[ "$avail" = "n" ] && ret="${opts:+${opts},}$opt1"

	printf "%s" "$ret"
}

shell_quote() {
	arg="$1"

	printf "%s" "'$(printf "%s" "$arg" | sed "s/'/'\"'\"'/g")'"
}

push_undo_cmd() {
	cmd="$1"; shift

	line="$cmd"
	for arg in "$@"; do
		quoted=$(shell_quote "$arg")
		line="$line $quoted"
	done

	if [ "x$journal" = "x" ]; then
		journal="$line
"
	else
		journal="$line
$journal"
	fi

	return 0
}

rollback() {
	rc=$?

	trap '' EXIT INT TERM

	if [ "x$journal" != "x"  ]; then
		while IFS= read -r cmdline; do
			if ! sh -c "$cmdline" && [ "x$OVLROOT_ABORT_RO_ON_ERROR" = "xy" ]; then
				exit "$rc"
			fi
		done <<EOD
$journal
EOD
	fi

	[ "x$OVLROOT_NEW_FSTAB" != "x" ] && [ -f "$OVLROOT_NEW_FSTAB" ] && \
	rm -f "$OVLROOT_NEW_FSTAB"

	exit "$rc"
}

OVLROOT_INIT_ROOTMNT="/new_root"
OVLROOT_CFGDIR="/etc/ovlroot.d"
OVLROOT_BASE_TYPE="tmpfs"
OVLROOT_BASE_OPTS=""
OVLROOT_BASE_DEV=""
OVLROOT_BASE_DIR="/.ovlroot"
OVLROOT_BASE_CLEAN="n"
OVLROOT_LOWER_DIR="lowerdir"
OVLROOT_UPPER_DIR="upperdir"
OVLROOT_WORK_DIR="workdir"
OVLROOT_FSTAB="/etc/fstab"
OVLROOT_NEW_FSTAB=""
OVLROOT_LOWER_MODE="ro"
OVLROOT_OVL_OPTS_ROOT=""
OVLROOT_ROOT_FSTAB_OPTS="n"
OVLROOT_ABORT_RO_ON_ERROR="n"
OVLROOT_LIST_SEP=","
OVLROOT_OVERLAY=""
OVLROOT_DISABLE=""
OVLROOT_RDONLY=""
OVLROOT_SWAP="on"

if [ "x$1" != "x" ]; then
	if [ -s "$OVLROOT_CFGDIR/$1.conf" ]; then
		. "$OVLROOT_CFGDIR/$1.conf"
	else
		exit 1
	fi
fi

ovl_lower_dir=""
ovl_upper_dir=""
ovl_work_dir=""
root_init_mode=""
root_init_opts=""
root_new_opts=""
modified="n"
journal=""
ovlopts=""
fs=""
dir="" 
type=""
opts=""
dump=""
pass=""
err="" 
line=""
_line=""
_dir=""

[ "x$OVLROOT_INIT_ROOTMNT" = "x" ] && exit 1
[ "x$OVLROOT_CFGDIR" = "x" ]       && exit 1
[ "x$OVLROOT_FSTAB" = "x" ]        && exit 1
[ "x$OVLROOT_BASE_DIR" = "x" ]     && exit 1
[ "x$OVLROOT_LOWER_DIR" = "x" ]    && \
[ "x$OVLROOT_UPPER_DIR" = "x" ]    && \
[ "x$OVLROOT_WORK_DIR" = "x" ]     && exit 1
[ "x$OVLROOT_BASE_TYPE" = "x" ]    && \
[ "x$OVLROOT_BASE_DEV" = "x" ]     && exit 1
[ "x$OVLROOT_LIST_SEP" = "x" ]     && OVLROOT_LIST_SEP=","

if [ "x$OVLROOT_LOWER_MODE" != "xrw" ] && [ "x$OVLROOT_LOWER_MODE" != "xro" ]; then
	OVLROOT_LOWER_MODE="ro"
fi

while IFS= read -r line; do
	set -f
	set -- $line

	fs="$1"; dir="$2"; type="$3"; opts="$4"; dump="$5"; pass="$6"

	set +f

	dir=$(printf "%s" "$dir" | sed 's/\\040/ /g')

	if [ "$dir" = "$OVLROOT_INIT_ROOTMNT" ]; then
		root_init_opts="$opts";
	fi
done <"/proc/mounts"

if [ "x$root_init_opts" != "x" ]; then
	oldIFS="$IFS"
	IFS=","

	for opt in $root_init_opts; do
		case "$opt" in
			ro | rw)
				root_init_mode="$opt" ;;
		esac
	done

	IFS="$oldIFS"
	unset oldIFS
fi

if [ "x$root_init_mode" = "x" ]; then
	root_init_mode="ro"

	for opt in $(cat "/proc/cmdline"); do
		if [ "$opt" = "rw" ]; then
			root_init_mode="rw"
		fi
	done

	root_init_opts="$(opts_add_replace "$root_init_opts" "$root_init_mode")"
fi

if [ "x$OVLROOT_NEW_FSTAB" = "x" ]; then
	OVLROOT_NEW_FSTAB="$(mktemp 2>>/dev/null || printf '/tmp/new_fstab.%s' "$$")"
fi

ovl_lower_dir="$OVLROOT_BASE_DIR/$OVLROOT_LOWER_DIR"
ovl_upper_dir="$OVLROOT_BASE_DIR/$OVLROOT_UPPER_DIR"
ovl_work_dir="$OVLROOT_BASE_DIR/$OVLROOT_WORK_DIR"

mkdir -p "$OVLROOT_BASE_DIR" || exit 1
push_undo_cmd "cd /; rmdir -p $(shell_quote "${OVLROOT_BASE_DIR#/}")"

[ "x$OVLROOT_BASE_DEV"   = "x" ] && OVLROOT_BASE_DEV="$OVLROOT_BASE_TYPE"
[ "x$OVLROOT_BASE_OPTS" != "x" ] && OVLROOT_BASE_OPTS="-o $OVLROOT_BASE_OPTS"
[ "x$OVLROOT_BASE_TYPE" != "x" ] && OVLROOT_BASE_TYPE="-t $OVLROOT_BASE_TYPE"

if ! mount $OVLROOT_BASE_OPTS $OVLROOT_BASE_TYPE -- "$OVLROOT_BASE_DEV" \
     "$OVLROOT_BASE_DIR"; then
	exit 1
fi
push_undo_cmd umount "$OVLROOT_BASE_DIR"

if [ "x$OVLROOT_BASE_CLEAN" = "xy" ]; then
	(cd "$OVLROOT_BASE_DIR"; find . -mindepth 1 -exec rm -rf '{}' +)
fi

if ! mkdir -p "$ovl_lower_dir"; then
	exit 1
fi
push_undo_cmd "cd $(shell_quote "$OVLROOT_BASE_DIR"); rmdir -p \
$(shell_quote "$OVLROOT_LOWER_DIR")"

if ! mkdir -p "$ovl_upper_dir/rootfs"; then
	exit 1
fi
push_undo_cmd "cd $(shell_quote "$OVLROOT_BASE_DIR"); rmdir -p \
$(shell_quote "$OVLROOT_UPPER_DIR/rootfs")"

if ! mkdir -p "$ovl_work_dir/rootfs"; then
	exit 1
fi
push_undo_cmd "cd $(shell_quote "$OVLROOT_BASE_DIR"); rmdir -p \
$(shell_quote "$OVLROOT_WORK_DIR/rootfs")"

if ! mount -o "move" "$OVLROOT_INIT_ROOTMNT" "$ovl_lower_dir"; then
	exit 1
fi
push_undo_cmd mount -o move "$ovl_lower_dir" "$OVLROOT_INIT_ROOTMNT"

if [ "x$OVLROOT_OVL_OPTS_ROOT" != "x" ]; then
	ovlopts="${OVLROOT_OVL_OPTS_ROOT},"
fi

if ! mount -t "overlay" -o "${ovlopts}lowerdir=$ovl_lower_dir,\
upperdir=$ovl_upper_dir/rootfs,workdir=$ovl_work_dir/rootfs" \
"ovlroot" -- "$OVLROOT_INIT_ROOTMNT"; then
	exit 1
fi
push_undo_cmd umount "$OVLROOT_INIT_ROOTMNT"

if ! mkdir -p "$OVLROOT_INIT_ROOTMNT/$OVLROOT_BASE_DIR"; then
	exit 1
fi
push_undo_cmd rmdir "$OVLROOT_INIT_ROOTMNT/$OVLROOT_BASE_DIR"

if ! mount -o "move" "$OVLROOT_BASE_DIR" \
"$OVLROOT_INIT_ROOTMNT/$OVLROOT_BASE_DIR"; then
	exit 1
fi
push_undo_cmd mount -o move "$OVLROOT_INIT_ROOTMNT/$OVLROOT_BASE_DIR" \
"$OVLROOT_BASE_DIR"

while IFS= read -r line; do
	[ "x$line" = "x" ] && { echo ""; continue; }

	_line="${line%%#*}"

	set -f
	set -- $_line

	fs="$1"; dir="$2"; type="$3"; opts="$4"; dump="$5"; pass="$6"; err="$7"

	set +f

	if [ "x$err"  != "x" ] || [ "x$opts" = "x" ]; then
		echo "$line"; continue
	fi

	dir=$(printf "%s" "$dir" | sed 's/\\040/ /g')

	if [ "$type" = "swap" ]; then
		if [ "x$OVLROOT_SWAP" = "xoff" ]; then			
			printf "# "
		fi

		echo "$line"
		continue
	fi

	modified=n

	if [ "$dir" = "/" ]; then
		if [ "x$OVLROOT_ROOT_FSTAB_OPTS" = "xy" ]; then
			root_new_opts="$opts"
		fi

		continue
	fi

	if [ "$modified" = "n" ] && [ "x$OVLROOT_OVERLAY" != "x" ]; then
		oldIFS="$IFS"
		IFS="$OVLROOT_LIST_SEP"

		for _dir in $OVLROOT_OVERLAY; do
			if [ "$_dir" = "$dir" ]; then
				if [ "$OVLROOT_LOWER_MODE" = "ro" ]; then
					opts="$(opts_add_replace "$opts" "ro" "rw")"
				else
					opts="$(opts_add_replace "$opts" "rw" "ro")"
				fi

				opts="ovlroot_realfs=$type,$opts"
				type="ovlroot"
				modified="y"
				break
			fi
		done

		IFS="$oldIFS"
		unset oldIFS
	fi

	if [ "$modified" = "n" ] && [ "x$OVLROOT_RDONLY" != "x" ]; then
		oldIFS="$IFS"
		IFS="$OVLROOT_LIST_SEP"

		for _dir in $OVLROOT_RDONLY; do
			if [ "$_dir" = "$dir" ]; then
				opts="$(opts_add_replace "$opts" "ro" "rw")"
				modified="y"
				break
			fi
		done

		IFS="$oldIFS"
		unset oldIFS
	fi

	if [ "$modified" = "n" ] && [ "x$OVLROOT_DISABLE" != "x" ]; then
		oldIFS="$IFS"
		IFS="$OVLROOT_LIST_SEP"

		for _dir in $OVLROOT_DISABLE; do
			if [ "$_dir" = "$dir" ]; then
				line="# $line"
				break
			fi
		done

		IFS="$oldIFS"
		unset oldIFS
	fi

	dir=$(printf "%s" "$dir" | sed 's/ /\\040/g')

	if [ "$modified" = "y" ]; then
		printf "%s\t%s\t%s\t%s\t%s\t%s\n" \
			   "$fs" "$dir" "$type" "$opts" "${dump:-0}" "${pass:-0}"
	else
		echo "$line"
	fi
done <"$OVLROOT_INIT_ROOTMNT/$OVLROOT_FSTAB" >>"$OVLROOT_NEW_FSTAB"

if [ "$root_init_mode" != "$OVLROOT_LOWER_MODE" ] || [ "x$root_new_opts" != "x" ]; then
	if [ "$OVLROOT_LOWER_MODE" = "ro" ]; then
		root_new_opts="$(opts_add_replace "$root_new_opts" "ro" "rw")"
	else
		root_new_opts="$(opts_add_replace "$root_new_opts" "rw" "ro")"
	fi
fi 

if [ "x$root_new_opts" != "x" ]; then
	if ! mount -o "remount,$root_new_opts" "$OVLROOT_INIT_ROOTMNT/$ovl_lower_dir"; then
		exit 1
	fi
	push_undo_cmd mount -o "remount,$root_init_opts" "$ovl_lower_dir"
fi

if ! mv "$OVLROOT_NEW_FSTAB" "$OVLROOT_INIT_ROOTMNT/$OVLROOT_FSTAB"; then
	exit 1
fi

(cd "/"; rmdir -p "${OVLROOT_BASE_DIR#/}")

trap - EXIT INT TERM
exit 0 
