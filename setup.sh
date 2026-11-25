#!/usr/bin/env bash
#
# darkmini - minimal dark theme for rEFInd and RefindPlus
#
# Copies the theme into the ESP and adds the matching include line to the
# bootloader configuration. Run with -u to remove it again.
#
# This file is part of the refind-theme-darkmini-git package.

set -euo pipefail

readonly theme_name='darkmini'
readonly theme_rel_dir="themes/${theme_name}"

current_dir="${BASH_SOURCE[0]%/*}"
if [[ "$current_dir" == "${BASH_SOURCE[0]}" || "$current_dir" == '.' ]]; then
    current_dir="$PWD"
fi
readonly current_dir

theme_conf='theme-mini.conf'
conf_explicit=0
bootloader='auto'
esp_override=''
uninstall=0

usage() {
    cat <<EOF
Usage: ${0##*/} [options]

Install the darkmini theme for rEFInd and/or RefindPlus on the ESP.

Options:
  -b, --bootloader <name>  refind, refindplus or all (default: auto-detect)
  -e, --esp <path>         mounted ESP, e.g. /boot or /efi
  -f, --full               include theme.conf instead of theme-mini.conf
  -m, --mini               include theme-mini.conf (the default)
  -u, --uninstall          remove the theme and its include line
  -h, --help               show this help

Environment:
  ESP=<path>               same as --esp

The theme is copied to <esp>/EFI/<bootloader>/${theme_rel_dir} and an
include line for the selected theme configuration is appended to
refind.conf (rEFInd) or config.conf (RefindPlus). If the theme is already
included, the configuration is left untouched, so nothing is added twice.
EOF
}

warn() {
    printf 'darkmini: %s\n' "$*" >&2
}

die() {
    printf 'darkmini: %s\n' "$*" >&2
    exit 1
}

cmd_sudo() {
    if [[ "$EUID" -ne 0 ]] && command -v sudo >/dev/null 2>&1; then
        sudo "$@"
    else
        "$@"
    fi
}

while (($#)); do
    case "$1" in
        -b|--bootloader)
            (($# >= 2)) || die "$1 requires an argument: refind, refindplus or all"
            bootloader=$2
            shift 2
            ;;
        -e|--esp)
            (($# >= 2)) || die "$1 requires a path"
            esp_override=${2%/}
            shift 2
            ;;
        -f|--full)
            theme_conf='theme.conf'
            conf_explicit=1
            shift
            ;;
        -m|--mini)
            theme_conf='theme-mini.conf'
            conf_explicit=1
            shift
            ;;
        -u|--uninstall)
            uninstall=1
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            die "unknown option: $1 (try --help)"
            ;;
    esac
done

case "$bootloader" in
    auto|refind|refindplus|all) ;;
    *) die "invalid bootloader '$bootloader' (expected refind, refindplus, all or auto)" ;;
esac

if [[ -n "$esp_override" ]]; then
    ESP=$esp_override
fi

detect_esp() {
    if [[ -n "${ESP:-}" ]]; then
        printf '%s\n' "${ESP%/}"
        return 0
    fi

    local candidate
    for candidate in /boot/efi /boot /efi; do
        if [[ -d "$candidate/EFI" ]]; then
            printf '%s\n' "$candidate"
            return 0
        fi
    done

    printf '%s\n' '/boot/efi'
    return 1
}

if ! esp=$(detect_esp); then
    warn "could not find an EFI system partition, falling back to ${esp}"
    warn "set ESP=/path/to/esp or pass --esp PATH to override"
fi
readonly esp

if [[ ! -d "$esp/EFI" ]]; then
    warn "no EFI directory under ${esp}; nothing to do"
    exit 0
fi

# Print the configuration file of one bootloader.
config_for() {
    local loader=$1
    local boot_dir="$esp/EFI/$1"
    local name

    case "$loader" in
        refind) name='refind.conf' ;;
        refindplus) name='config.conf' ;;
        *) die "unknown bootloader: $loader" ;;
    esac

    # RefindPlus normally reads config.conf, but accept refindplus.conf too.
    if [[ "$loader" == 'refindplus' && ! -f "$boot_dir/$name" && -f "$boot_dir/refindplus.conf" ]]; then
        name='refindplus.conf'
    fi

    printf '%s\n' "$boot_dir/$name"
}

# Print the bootloaders to operate on, one per line.
select_targets() {
    case "$bootloader" in
        refind|refindplus)
            printf '%s\n' "$bootloader"
            ;;
        all)
            printf 'refind\nrefindplus\n'
            ;;
        auto)
            local loader
            for loader in refind refindplus; do
                if [[ -d "$esp/EFI/$loader" ]]; then
                    printf '%s\n' "$loader"
                fi
            done
            ;;
    esac
}

remove_include() {
    local conf_file=$1

    [[ -f "$conf_file" ]] || return 0
    cmd_sudo sed -i "\|^[[:space:]]*include[[:space:]]\+${theme_rel_dir}/|d" "$conf_file"
}

# Report whether the theme is already included in one configuration file:
# 1 = the selected theme configuration, 2 = another darkmini configuration,
# 0 = not included.
include_state() {
    local conf_file=$1

    if [[ ! -f "$conf_file" ]]; then
        printf '0\n'
        return 0
    fi

    if grep -Eq "^[[:space:]]*include[[:space:]]+${theme_rel_dir}/${theme_conf}([[:space:]]|$)" "$conf_file"; then
        printf '1\n'
    elif grep -Eq "^[[:space:]]*include[[:space:]]+${theme_rel_dir}/" "$conf_file"; then
        printf '2\n'
    else
        printf '0\n'
    fi
}

install_theme() {
    local loader=$1
    local boot_dir="$esp/EFI/$loader"
    local target_dir="$boot_dir/$theme_rel_dir"
    local conf_file state

    if [[ ! -d "$boot_dir" ]]; then
        warn "skipping ${loader}: ${boot_dir} not found"
        return 0
    fi

    printf 'Installing %s for %s into %s\n' "$theme_name" "$loader" "$target_dir"

    cmd_sudo mkdir -p "$target_dir"
    cmd_sudo cp -R "${current_dir}/icons" "${current_dir}/bg" "$target_dir/"
    cmd_sudo install -m0644 \
        "${current_dir}/theme.conf" \
        "${current_dir}/theme-mini.conf" \
        "${current_dir}/selection_big.png" \
        "${current_dir}/selection_small.png" \
        "$target_dir/"

    conf_file=$(config_for "$loader")
    if [[ ! -f "$conf_file" ]]; then
        warn "${conf_file} not found; add 'include ${theme_rel_dir}/${theme_conf}' to it manually"
        return 0
    fi

    # Do not add a second include when the theme is already enabled.
    state=$(include_state "$conf_file")
    if [[ "$state" == '1' ]]; then
        printf 'Theme already included in %s; left unchanged\n' "$conf_file"
        return 0
    fi
    if [[ "$state" == '2' ]] && ((!conf_explicit)); then
        printf 'Theme already included in %s; left unchanged (use -f or -m to switch)\n' "$conf_file"
        return 0
    fi

    # Make sure the include line starts on a fresh line.
    if [[ -s "$conf_file" && -n "$(tail -c1 "$conf_file")" ]]; then
        printf '\n' | cmd_sudo tee -a "$conf_file" >/dev/null
    fi

    remove_include "$conf_file"
    printf 'include %s/%s\n' "$theme_rel_dir" "$theme_conf" | cmd_sudo tee -a "$conf_file" >/dev/null
    printf 'Enabled %s/%s in %s\n' "$theme_rel_dir" "$theme_conf" "$conf_file"
}

uninstall_theme() {
    local loader=$1
    local boot_dir="$esp/EFI/$loader"
    local target_dir="$boot_dir/$theme_rel_dir"

    if [[ ! -d "$boot_dir" ]]; then
        warn "skipping ${loader}: ${boot_dir} not found"
        return 0
    fi

    case "$target_dir" in
        "$esp/EFI/refind/$theme_rel_dir" | "$esp/EFI/refindplus/$theme_rel_dir") ;;
        *) die "refusing to remove unexpected path: $target_dir" ;;
    esac

    remove_include "$(config_for "$loader")"

    if [[ -d "$target_dir" ]]; then
        cmd_sudo rm -rf -- "$target_dir"
        printf 'Removed %s from %s\n' "$theme_rel_dir" "$loader"
    else
        printf 'No %s theme found for %s\n' "$theme_name" "$loader"
    fi
}

main() {
    local targets=()
    local loader asset

    if ((!uninstall)); then
        for asset in icons bg theme.conf theme-mini.conf selection_big.png selection_small.png; do
            [[ -e "${current_dir}/${asset}" ]] || die "missing theme file: ${current_dir}/${asset}"
        done
    fi

    mapfile -t targets < <(select_targets)
    if ((${#targets[@]} == 0)); then
        warn "no rEFInd or RefindPlus installation found under ${esp}/EFI; nothing to do"
        return 0
    fi

    for loader in "${targets[@]}"; do
        if ((uninstall)); then
            uninstall_theme "$loader"
        else
            install_theme "$loader"
        fi
    done
}

main
