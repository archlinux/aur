# Which configurations and images `mkinitcpio -P` works with, resolved the way
# mkinitcpio itself resolves them. Sourced by the libalpm script, to decide
# whether a tailscale upgrade needs a rebuild, and by setup-initcpio-tailscale
# --check, to know which HOOKS= arrays to verify and which images to open.
#
# Installed as /usr/lib/mkinitcpio-tailscale/presets.sh. Functions only; every
# file it reads is sourced in a subshell, so nothing leaks into the caller.
#
# shellcheck shell=bash

# The same overrides mkinitcpio honours, so both always look at the same files.
TS_MKI_CONF=${MKINITCPIO_CONF:-/etc/mkinitcpio.conf}
TS_MKI_PRESETS=${MKINITCPIO_PRESETS:-/etc/mkinitcpio.d}

# ts_presets
#
# One line per image `mkinitcpio -P` would build, tab separated:
#
#   <preset file>:<name>  <config>  <image>  <uki>
#
# <config> is '-' when the preset names none, which is not the same as naming
# the default file: only then does mkinitcpio add the conf.d drop-ins. <image>
# and <uki> are '-' when unset. Presets mkinitcpio would skip -- no kernel
# version, or neither an image nor a UKI -- are skipped here too.
ts_presets() {
	local f
	for f in "$TS_MKI_PRESETS"/*.preset; do
		[[ -r $f ]] || continue
		(
			local p kver cfg img uki
			# shellcheck source=/dev/null
			. "$f" >/dev/null 2>&1 || exit 0
			for p in ${PRESETS[@]+"${PRESETS[@]}"}; do
				kver=${p}_kver
				[[ -n ${!kver:-${ALL_kver:-}} ]] || continue
				cfg=${p}_config
				cfg=${!cfg:-${ALL_config:-}}
				img=${p}_image
				img=${!img:-}
				# <name>_efi_image is the deprecated spelling mkinitcpio still reads.
				uki=${p}_uki
				[[ ! -v $uki && -v ${p}_efi_image ]] && uki=${p}_efi_image
				uki=${!uki:-}
				[[ -n $img || -n $uki ]] || continue
				printf '%s:%s\t%s\t%s\t%s\n' "${f##*/}" "$p" "${cfg:--}" "${img:--}" "${uki:--}"
			done
		)
	done
}

# ts_configs
#
# The distinct configurations the presets build from, in ts_presets' notation
# ('-' for the default file plus drop-ins), one per line. With no usable
# preset at all, the default: what a plain `mkinitcpio` run would read.
ts_configs() {
	local out
	out=$(ts_presets | cut -f2 | awk '!seen[$0]++')
	printf '%s\n' "${out:--}"
}

# ts_config_name <config> -> a name for messages
ts_config_name() {
	if [[ $1 == - ]]; then
		printf '%s' "$TS_MKI_CONF"
	else
		printf '%s' "$1"
	fi
}

# ts_hooks <config>
#
# The effective HOOKS= of one configuration, one hook per line. For '-' that is
# the default file followed by its drop-ins in mkinitcpio's order (version sort
# of the file names), later assignments overriding earlier ones; a named file
# is read on its own, since mkinitcpio ignores the drop-ins for it.
ts_hooks() {
	(
		local f
		local -a files=() split=()
		if [[ $1 == - ]]; then
			files=("$TS_MKI_CONF")
			if [[ -d ${TS_MKI_CONF}.d ]]; then
				while IFS= read -r -d '' f; do
					files+=("${TS_MKI_CONF}.d/$f")
				done < <(LC_ALL=C.UTF-8 find "${TS_MKI_CONF}.d" -maxdepth 1 -xtype f -name '*.conf' -printf '%f\0' |
					LC_ALL=C.UTF-8 sort -zVu)
			fi
		else
			files=("$1")
		fi
		HOOKS=()
		for f in "${files[@]}"; do
			[[ -r $f ]] || continue
			# shellcheck source=/dev/null
			. "$f" >/dev/null 2>&1
		done
		# HOOKS may be a plain string rather than an array: Arch shipped that
		# form for years, a .pacnew upgrade leaves it in place, and mkinitcpio
		# accepts both (arrayize_config). Joining and re-splitting on any
		# whitespace reads either the same way, a string spread over several
		# lines included; hook names have no whitespace to lose.
		IFS=$' \t\n' read -r -d '' -a split <<<"${HOOKS[*]:-}" || true
		printf '%s\n' ${split[@]+"${split[@]}"}
	)
}

# ts_uses_hook <config>: whether that configuration lists the tailscale hook.
ts_uses_hook() {
	ts_hooks "$1" | grep -qx tailscale
}
