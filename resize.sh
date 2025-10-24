#!/usr/bin/env bash

SRC="source-icon.svg"
COLORS_CONF="colors.conf"
OUT="pack"

SECTION="${1:-default}"

get_color() {
    awk -v section="$1" -v key="$2" '
        /^\[.*\]/ {current_section=tolower(substr($0, 2, length($0)-2))}
        current_section==section && $0 ~ key"=" {
            split($0, arr, "="); print arr[2]
        }
    ' "$COLORS_CONF" | tr -d ' '
}

OUTER_COLOR=$(get_color "$SECTION" "outer")
INNER_COLOR=$(get_color "$SECTION" "inner")
if [[ -z "$OUTER_COLOR" || -z "$INNER_COLOR" ]]; then
    echo "Error: Missing colors in [$SECTION] of $COLORS_CONF"
    exit 1
fi

if ! magick -list format | grep -q "SVG.*rw"; then
    echo "Error: ImageMagick lacks SVG support. Install librsvg (e.g., 'sudo apt install librsvg2-bin' or 'brew install librsvg')"
    exit 1
fi

rm -rf "$OUT" && mkdir -p "$OUT"

TEMP_SVG="temp-icon.svg"
cp "$SRC" "$TEMP_SVG"
sed "s/fill:#5865f2/fill:$OUTER_COLOR/" "$TEMP_SVG" > "$TEMP_SVG.tmp" && mv "$TEMP_SVG.tmp" "$TEMP_SVG"
sed "s/fill:#e0e3ff/fill:$INNER_COLOR;stroke:none;fill-opacity:1/" "$TEMP_SVG" > "$TEMP_SVG.tmp" && mv "$TEMP_SVG.tmp" "$TEMP_SVG"

SIZES=(16 32 48 64 128 256 512 1024)
for SZ in "${SIZES[@]}"; do
    DEST="$OUT/icons/hicolor/${SZ}x${SZ}/apps"
    mkdir -p "$DEST"
    magick -background none "$TEMP_SVG" -resize "${SZ}x${SZ}" "$DEST/vesktop.png" || {
        echo "Error: Failed to generate $DEST/vesktop.png"
        exit 1
    }
    optipng -o7 -quiet "$DEST/vesktop.png"
done

mkdir -p "$OUT/static"
magick -background none "$TEMP_SVG" -resize 1080x1080 "$OUT/static/vesktop.png" || {
    echo "Error: Failed to generate $OUT/static/vesktop.png"
    exit 1
}
optipng -o7 -quiet "$OUT/static/vesktop.png"

# Windows ICO because we are here... so why not? Maybe it will help dual booters.
ICO_OUT="$OUT/static/icon.ico"
ICO_SIZES=(16 32 48 64 128 256)
ICO_PNGS=()
for SZ in "${ICO_SIZES[@]}"; do
    ICO_PNGS+=("$OUT/icons/hicolor/${SZ}x${SZ}/apps/vesktop.png")
done
magick -background none "${ICO_PNGS[@]}" -thumbnail 128x128 "$ICO_OUT" || {
    echo "Error: Failed to generate $ICO_OUT"
    exit 1
}

cp "loader.gif" "$OUT/static/shiggy.gif"

rm "$TEMP_SVG"

echo "Icons generated in $OUT"
