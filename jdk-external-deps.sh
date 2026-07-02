#!/usr/bin/env bash
# Usage: ./jdk-external-deps.sh /path/to/JAVA_HOME

set -u
export LC_ALL=C

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 JAVA_HOME
This script is used to determined the required packages for this JDK." >&2
    exit 2
fi

JAVA_HOME=${1%/}

if [[ ! -d "$JAVA_HOME" ]]; then
    echo "Not a directory: $JAVA_HOME" >&2
    exit 2
fi

is_elf() {
    readelf -h -- "$1" >/dev/null 2>&1
}

needed_libs() {
    readelf -d -- "$1" 2>/dev/null |
        sed -n 's/.*Shared library: \[\([^]]*\)\].*/\1/p'
}

# Cache basenames of files bundled inside JAVA_HOME.
# If an ELF needs libfoo.so and JAVA_HOME contains a file/symlink named libfoo.so,
# we treat it as bundled.
declare -A bundled
while IFS= read -r -d '' f; do
    bundled["${f##*/}"]=1
done < <(find -L "$JAVA_HOME"/bin "$JAVA_HOME"/lib \( -type f -o -type l \) -print0 2>/dev/null)

find_system_lib() {
    local lib=$1
    local p

    # Absolute NEEDED entry, uncommon but possible.
    if [[ "$lib" = /* && -e "$lib" ]]; then
        printf '%s\n' "$lib"
        return 0
    fi

    # Arch usually keeps shared libraries in /usr/lib.
    for p in \
        "/usr/lib/$lib" \
        "/usr/lib32/$lib" \
        "/lib/$lib" \
        "/lib64/$lib"
    do
        if [[ -e "$p" ]]; then
            printf '%s\n' "$p"
            return 0
        fi
    done

    # Fallback through ldconfig cache.
    if command -v ldconfig >/dev/null 2>&1; then
        ldconfig -p 2>/dev/null |
            awk -v lib="$lib" '$1 == lib { print $NF; exit }'
        return 0
    fi

    return 1
}

declare -A owner_cache
declare -A path_cache

while IFS= read -r -d '' f; do
    is_elf "$f" || continue

    while IFS= read -r dep; do
        [[ -n "$dep" ]] || continue

        # Skip dependencies bundled by the JDK/GraalVM distribution itself.
        if [[ -n "${bundled[$dep]+x}" ]]; then
            continue
        fi

        if [[ -n "${path_cache[$dep]+x}" ]]; then
            dep_path=${path_cache[$dep]}
        else
            dep_path=$(find_system_lib "$dep" | head -n1)
            path_cache[$dep]=$dep_path
        fi

        if [[ -n "$dep_path" ]]; then
            if [[ -n "${owner_cache[$dep_path]+x}" ]]; then
                owner=${owner_cache[$dep_path]}
            else
                owner=$(pacman -Qqo -- "$dep_path" 2>/dev/null || true)
                [[ -n "$owner" ]] || owner="UNOWNED:$dep_path"
                owner_cache[$dep_path]=$owner
            fi
        else
            owner="NOT_FOUND"
        fi

        printf '%s:%s:%s\n' "$owner" "$dep" "$f"

    done < <(needed_libs "$f")

done < <(find -L "$JAVA_HOME"/bin "$JAVA_HOME"/lib \( -type f -o -type l \) -print0 2>/dev/null)
