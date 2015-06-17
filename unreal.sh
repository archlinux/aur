# This file provides several functions to ease packaging of Unreal based games
# for Arch Linux.  It should be sourced in the PKGBUILD's build() function.
#
# For an example of the usage of the functions take a look at the "ut1999"
# PKGBUILD on the Arch Linux AUR.

# Usage: _unreal_handle_files command from_dir to_dir ignore_regex < file_list
#
# Tries to find the basename of the files read from standard input in
# "from_dir" case insensitively and applies "command" which has the
# form "cmd source dest" (like cp or mv) to it, where the "dest" is
# "to_dir"/entry from stdin.  The files given by the case insensitive
# egrep style regular expression "ignore_regex" won't be searched.  You
# probably want to make sure that the target directories already exist.
#
# This function usually doesn't get called directly but by
# _unreal_(copy|install|move)_files with "command" already filled in.
_unreal_handle_files() {
    local dir

    while read stdin; do
        find -- "$2" -regextype posix-egrep \
                -iname "$(basename -- "${stdin}")" -a ! -iregex "$4" \
                -print | while read file
        do
            $1 "${file}" "$3/${stdin}" || return 1
        done
    done
}

# Usage: _unreal_copy_files from_dir to_dir ignore_regexp < file_list
#
# Calls _unreal_handle_files with "cp" as command.
_unreal_copy_files() {
    _unreal_handle_files "cp --force --" "$@" || return 1
}

# Usage: _unreal_install_files from_dir to_dir ignore_regexp < file_list
#
# Basically calls _unreal_handle_files with "install" as command.
_unreal_install_files() {
    _unreal_handle_files "install --mode=644 -D --" "$@" || return 1
}

# Usage: _unreal_move_files from_dir to_dir ignore_regexp < file_list
#
# Just calls _unreal_handle_files with "mv" as command.
_unreal_move_files() {
    _unreal_handle_files "mv --force --" "$@" || return 1
}

# Usage: _unreal_decompress_files from_dir to_dir ingore_regex < file_list
#
# Reads a "file_list" from standard input, tries to find their basenames
# in "from_dir" case insensitively and decompresses them with the
# command "to_dir/ucc".  The direcories given by the case insensitive
# egrep style regular expression "ignore_dir_regex" won't be searched.
#
# ucc stores the decomressed files in "to_dir/System".  So you might
# want to apply the same "file_list" (minus the .uz ending) to
# _unreal_move_files to correct the location.
_unreal_decompress_files() {
    while read stdin; do
        find -- "$1" -regextype posix-egrep \
                -iname "$(basename -- "${stdin}")" -a ! -iregex "$3" \
                -print | while read file
        do
            "$2/ucc" decompress "${file}" -nohomedir || return 1
        done
    done
}

# Usage: _unreal_loki_patcher continue_on_fail from_dir to_dir ignore_regex
#
# Apply the Xdelta patches and gzip replacement files residing in the
# parallel directory structure in "from_dir" to the files in "to_dir",
# where files matching the egrep regular expression "ignore_regex"
# will be ignored.  If "continue_on_fail" is "true" the function whill
# continue even if a single patch couldn't be applied.  If it is "false"
# the function will terminate when only a single patch doesn't apply
# correctly.
#
# This function usually doesn't get called directly but by
# _unreal_fail_{fast,safe}_patcher with "continue_on_fail" already
# filled in.
_unreal_loki_patcher() {
    local dest
    cd "$2"
    mkdir -p xdelta.tmp

    find . -regextype posix-egrep \
        -type f -a ! -iregex ".*/xdelta.tmp/.*" -a ! -iregex "$4" \
        -print | while read file
    do
        case "$(file -b -- "${file}")" in
            (*XDelta*)
                dest="$(echo "${file}" | sed 's/\.0$//')"
                xdelta patch -- "${file}" "$3/${dest}" \
                        "xdelta.tmp/$(basename -- "${dest}")" \
                        && install --mode=644 -D -- \
                        "xdelta.tmp/$(basename -- "${dest}")" "$3/${dest}" \
                        || "$1" || return 1
                ;;
            (*gzip*)
                gzip --decompress --stdout -- "${file}" > "$3/${file}" \
                        || "$1" || return 1
                ;;
            (*executable*)
                install --mode=755 -D -- "${file}" "$3/${file}" \
                        || "$1" || return 1
                ;;
            (*)
                install --mode=644 -D -- "${file}" "$3/${file}" \
                        || "$1" || return 1
                ;;
        esac
    done
    cd - > /dev/null
}

# Usage: _unreal_fail_safe_patcher from_dir to_dir ignore_regex
#
# Tries to apply the patches found in "form_dir" to "to_dir", but
# doesn't exit if a single patch doesn't apply.
_unreal_fail_safe_patcher() {
    _unreal_loki_patcher "true" "$@" || return 1
}

# Usage: _unreal_fail_fast_patcher from_dir to_dir ignore_regex
#
# Like _unreal_fail_safe_patcher, but exits if only a single patch
# couldn't be applied successfully.
_unreal_fail_fast_patcher() {
    _unreal_loki_patcher "false" "$@" || return 1
}

