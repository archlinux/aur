#!/bin/bash
# Update script for gnome-meta PKGBUILD
# This script updates the depends array to match the current 'gnome' package group

set -euo pipefail

SCRIPT_FILE=$(readlink -f -- "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(dirname -- "$SCRIPT_FILE")
SCRIPT_DIR=$(cd -- "$SCRIPT_DIR" && pwd -P)
PKGBUILD_FILE="$SCRIPT_DIR/PKGBUILD"
TEMP_DIR=$(mktemp -d "$SCRIPT_DIR/.update.XXXXXXXX")
ORIGINAL_FILE="$TEMP_DIR/PKGBUILD.original"
STAGED_FILE="$TEMP_DIR/PKGBUILD.new"
CURRENT_DEPENDS_FILE="$TEMP_DIR/current_depends"
NEW_DEPENDS_FILE="$TEMP_DIR/new_depends"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

cp --preserve=mode -- "$PKGBUILD_FILE" "$ORIGINAL_FILE"
if ! BASH_ENV=/dev/null bash -n -- "$ORIGINAL_FILE"; then
    echo "Error: PKGBUILD has invalid shell syntax; it was not changed." >&2
    exit 1
fi

echo "Getting current 'gnome' package group..."
# Get packages in gnome group, deduplicate them, and sort them.
# pacman -Sg can list the same package more than once when multiple repos
# provide the same group entry.
pacman -Sg gnome | cut -d' ' -f2 | sort -u > "$NEW_DEPENDS_FILE"

if [[ ! -s "$NEW_DEPENDS_FILE" ]]; then
    echo "Error: the gnome package group is empty; PKGBUILD was not changed." >&2
    exit 1
fi

echo "Extracting current depends from PKGBUILD..."
# Validate one static depends array and stage its replacement without executing
# PKGBUILD. File paths are passed through ARGV to avoid awk escape processing.
: > "$CURRENT_DEPENDS_FILE"
awk '
function fail(message) {
    print "Error: " message "; PKGBUILD was not changed." > "/dev/stderr"
    failed = 1
    exit 1
}
function emit_array(    i) {
    print "depends=("
    for (i = 1; i <= new_count; i++) print "  " new_packages[i]
    print ")"
}
# Scan only simple single-line shell text outside the array. Quoted strings and
# comments cannot define depends; reject layouts needing a full shell parser.
function outside_code(text,    i, character, quote, code) {
    literal_line = text
    for (i = 1; i <= length(text); i++) {
        character = substr(text, i, 1)
        if (quote == "\047") {
            if (character == quote) quote = ""
            code = code " "
            continue
        }
        if (character == "\\") {
            if (i == length(text)) fail("line continuations are unsupported")
            i++
            code = code "  "
            continue
        }
        if (character == "\140" ||
            (character == "$" && substr(text, i + 1, 1) == "("))
            fail("command substitutions are unsupported")
        if (quote == "\042") {
            if (character == quote) quote = ""
            code = code " "
            continue
        }
        if (character == "#" &&
            (i == 1 || substr(text, i - 1, 1) ~ /[[:space:];()]/)) {
            literal_line = substr(text, 1, i - 1)
            break
        }
        if (character == "\047" || character == "\042") {
            quote = character
            code = code " "
            continue
        }
        code = code character
    }
    if (quote != "") fail("multiline quoted strings are unsupported")
    if (code ~ /<</) fail("here documents and here strings are unsupported")
    return code
}
BEGIN {
    new_file = ARGV[1]
    current_file = ARGV[2]
    ARGV[1] = ARGV[2] = ""
    while ((status = getline package < new_file) > 0) {
        if (package !~ /^[[:alnum:]@._+-]+$/) fail("invalid package group entry")
        new_packages[++new_count] = package
    }
    if (status < 0 || close(new_file) != 0 || new_count == 0)
        fail("could not read the package group")
}
{
    if (!in_depends) {
        code = outside_code($0)
        if (code ~ /(^|[^[:alnum:]_])depends[[:space:]]*(\+?=|\[)/ &&
            $0 !~ /^[[:space:]]*depends=/)
            fail("unsupported prefixed or conditional depends assignment")
        if (code ~ /(^|[[:space:];(])(declare|typeset|local|export|readonly|read|readarray|mapfile|unset|eval)[[:space:]]/ &&
            literal_line ~ /(^|[^[:alnum:]_])depends([^[:alnum:]_]|$)/)
            fail("unsupported depends declaration or mutation")
    }
    if ($0 ~ /^[[:space:]]*depends[[:space:]]*(\+?=|\[)/) {
        if (in_depends || ++arrays != 1) fail("multiple depends definitions")
        if ($0 ~ /^[[:space:]]*depends=\([[:space:]]*\)[[:space:]]*(#.*)?$/) {
            emit_array()
            next
        }
        if ($0 !~ /^[[:space:]]*depends=\([[:space:]]*(#.*)?$/)
            fail("unsupported depends definition; use a static multiline array")
        in_depends = 1
        emit_array()
        next
    }
    if (!in_depends) {
        print
        next
    }
    if ($0 ~ /^[[:space:]]*\)[[:space:]]*(#.*)?$/) {
        in_depends = 0
        next
    }
    line = $0
    sub(/^[[:space:]]+/, "", line)
    sub(/[[:space:]]+$/, "", line)
    if (line == "" || line ~ /^#/) next
    tokens = split(line, values, /[[:space:]]+/)
    for (i = 1; i <= tokens; i++) {
        value = values[i]
        if (value ~ /^#/) break
        quote = substr(value, 1, 1)
        if (quote == "\047" || quote == "\042") {
            if (length(value) < 2 || substr(value, length(value), 1) != quote)
                fail("unsupported quoted dependency")
            value = substr(value, 2, length(value) - 2)
        }
        if (value !~ /^[[:alnum:]@._+:-]+([<>=]+[[:alnum:]@._+:-]+)?$/)
            fail("unsupported dependency; use static package names")
        print value >> current_file
        wrote_current = 1
    }
}
END {
    if (failed) exit 1
    if (in_depends || arrays != 1) fail("expected one complete depends array")
    if (fflush() != 0) fail("could not write the staged PKGBUILD")
    if (wrote_current && close(current_file) != 0)
        fail("could not write the current dependencies")
}
' "$NEW_DEPENDS_FILE" "$CURRENT_DEPENDS_FILE" "$ORIGINAL_FILE" > "$STAGED_FILE"
# Preserve the suffix even when the original final line has no newline.
FINAL_NEWLINE=$(tail -c 1 -- "$ORIGINAL_FILE" | wc -l)
if (( FINAL_NEWLINE == 0 )); then
    truncate -s -1 -- "$STAGED_FILE"
fi
if ! BASH_ENV=/dev/null bash -n -- "$STAGED_FILE"; then
    echo "Error: staged PKGBUILD has invalid shell syntax; it was not installed." >&2
    exit 1
fi
chmod --reference="$ORIGINAL_FILE" -- "$STAGED_FILE"
# Keep existing duplicates so they are detected and removed during an update.
sort -o "$CURRENT_DEPENDS_FILE" "$CURRENT_DEPENDS_FILE"

echo "Comparing package lists..."
if diff -q "$CURRENT_DEPENDS_FILE" "$NEW_DEPENDS_FILE" > /dev/null; then
    echo "No changes detected in the gnome package group."
    exit 0
else
    diff_status=$?
    if (( diff_status != 1 )); then
        echo "Error: dependency comparison failed; PKGBUILD was not changed." >&2
        exit "$diff_status"
    fi
fi

echo "Changes detected! Here's the diff:"
echo "======================================="
if diff -u "$CURRENT_DEPENDS_FILE" "$NEW_DEPENDS_FILE"; then
    :
else
    diff_status=$?
    if (( diff_status != 1 )); then
        echo "Error: dependency comparison failed; PKGBUILD was not changed." >&2
        exit "$diff_status"
    fi
fi
echo "======================================="

echo
if ! read -p "Do you want to update the PKGBUILD? (y/N): " -n 1 -r; then
    echo
    echo "Update cancelled."
    exit 0
fi
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Update cancelled."
    exit 0
fi

echo "Updating PKGBUILD..."

# Refuse to overwrite an input that changed while the update was being reviewed.
if ! cmp -s -- "$ORIGINAL_FILE" "$PKGBUILD_FILE"; then
    echo "Error: PKGBUILD changed or could not be verified; it was not replaced." >&2
    exit 1
fi
# The candidate is on the same filesystem, so this replaces the file atomically.
mv -- "$STAGED_FILE" "$PKGBUILD_FILE"

echo "PKGBUILD updated successfully!"

echo "Make sure to update the pkgver or pkgrel and run"
echo "makepkg --printsrcinfo > .SRCINFO"
