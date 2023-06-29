#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
#
# Copy firmware files based on WHENCE list
#

verbose=:
prune=no
# shellcheck disable=SC2209
compress=cat
compext=

while test $# -gt 0; do
    case $1 in
        -v | --verbose)
            # shellcheck disable=SC2209
            verbose=echo
            shift
            ;;

        -P | --prune)
            prune=yes
            shift
            ;;

        --xz)
            if test "$compext" == ".zst"; then
                echo "ERROR: cannot mix XZ and ZSTD compression"
                exit 1
            fi
            compress="xz --compress --quiet --stdout --check=crc32"
            compext=".xz"
            shift
            ;;

        --zstd)
            if test "$compext" == ".xz"; then
                echo "ERROR: cannot mix XZ and ZSTD compression"
                exit 1
            fi
            # shellcheck disable=SC2209
            compress="zstd --compress --quiet --stdout"
            compext=".zst"
            shift
            ;;

        *)
            if test "x$destdir" != "x"; then
                echo "ERROR: unknown command-line options: $*"
                exit 1
            fi

            destdir="$1"
            shift
            ;;
    esac
done

# shellcheck disable=SC2162 # file/folder name can include escaped symbols
grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
    test -f "$f" || continue
    install -d "$destdir/$(dirname "$f")"
    $verbose "copying/compressing file $f$compext"
    if test "$compress" != "cat" && grep -q "^Raw: $f\$" WHENCE; then
        $verbose "compression will be skipped for file $f"
        cat "$f" > "$destdir/$f"
    else
        $compress "$f" > "$destdir/$f$compext"
    fi
done

# shellcheck disable=SC2162 # file/folder name can include escaped symbols
grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
    if test -L "$f$compext"; then
        test -f "$destdir/$f$compext" && continue
        $verbose "copying link $f$compext"
        install -d "$destdir/$(dirname "$f")"
        cp -d "$f$compext" "$destdir/$f$compext"

        if test "x$d" != "x"; then
            target="$(readlink "$f")"

            if test "x$target" != "x$d"; then
                $verbose "WARNING: inconsistent symlink target: $target != $d"
            else
                if test "x$prune" != "xyes"; then
                    $verbose "WARNING: unneeded symlink detected: $f"
                else
                    $verbose "WARNING: pruning unneeded symlink $f"
                    rm -f "$f$compext"
                fi
            fi
        else
            $verbose "WARNING: missing target for symlink $f"
        fi
    else
        install -d "$destdir/$(dirname "$f")"
        $verbose "creating link $f$compext -> $d$compext"
        ln -s "$d$compext" "$destdir/$f$compext"
    fi
done

exit 0

# vim: et sw=4 sts=4 ts=4
