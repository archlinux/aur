#!/bin/bash
# suscheck.sh - CLI wrapper for suscheck package
# suspcheck.sh - filtering engine

# --- Default paths ---
SUSCHECK_ENGINE="./suspcheck.sh"
DATA_DIR="./suscheck-data"

# --- Parse flags ---
ACTION=""
COUNTRY=""
LOC=""
DOMAIN=""
MAINT=""

while getopts "ARc:l:d:m:" opt; do
    case "$opt" in
        A) ACTION="add" ;;
        R) ACTION="remove" ;;
        c) COUNTRY="$OPTARG" ;;
        l) LOC="$OPTARG" ;;
        d) DOMAIN="$OPTARG" ;;
        m) MAINT="$OPTARG" ;;
        *) echo "Usage: $0 [-A|-R] [-c country] [-l location] [-d domain] [-m maintainer] [PKGBUILD]"; exit 1 ;;
    esac
done
shift $((OPTIND-1))

# --- Determine JSON file ---
if [[ -n "$COUNTRY" ]]; then
    FILE="$DATA_DIR/${COUNTRY,,}.json"
else
    FILE="$DATA_DIR/suspicious.json"
fi

# --- Create file if adding and missing ---
if [[ "$ACTION" == "add" && ! -f "$FILE" ]]; then
    jq -n --arg c "$COUNTRY" '{country:$c,reason:"",cities:[],domains:[],maintainers:[]}' > "$FILE"
fi

# --- Add / Remove entries ---
if [[ -n "$ACTION" && -f "$FILE" ]]; then
    TMP=$(mktemp)
    if [[ "$ACTION" == "add" ]]; then
        [[ -n "$LOC" ]] && jq --arg l "$LOC" '.cities += [$l] | .cities |= unique' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        [[ -n "$DOMAIN" ]] && jq --arg d "$DOMAIN" '.domains += [$d] | .domains |= unique' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        [[ -n "$MAINT" ]] && jq --arg m "$MAINT" '.maintainers += [$m] | .maintainers |= unique' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        echo "✅ Added entries to $FILE"
    elif [[ "$ACTION" == "remove" ]]; then
        [[ -n "$LOC" ]] && jq --arg l "$LOC" '.cities -= [$l]' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        [[ -n "$DOMAIN" ]] && jq --arg d "$DOMAIN" '.domains -= [$d]' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        [[ -n "$MAINT" ]] && jq --arg m "$MAINT" '.maintainers -= [$m]' "$FILE" > "$TMP" && mv "$TMP" "$FILE"
        echo "✅ Removed entries from $FILE"
    fi
    exit 0
fi

# --- If no add/remove, call the filtering engine ---
PKGBUILD="$1"
if [[ -z "$PKGBUILD" ]]; then
    echo "Usage: $0 [-A|-R] [-c country] [-l location] [-d domain] [-m maintainer] [PKGBUILD]"
    exit 1
fi

"$SUSCHECK_ENGINE" "$PKGBUILD"
