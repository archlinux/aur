#!/usr/bin/env bash

SRC="source-icon.svg"
SRC_NOTIFICATION="source-icon-notification.svg"
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

rm -rf "$OUT" && mkdir -p "$OUT"

process_svg_with_hicolor() {
    local src_file="$1"
    local output_name="$2"
    local temp_svg="temp-$output_name.svg"

    cp "$src_file" "$temp_svg"
    sed "s/fill:#5865f2/fill:$OUTER_COLOR/" "$temp_svg" > "$temp_svg.tmp" && mv "$temp_svg.tmp" "$temp_svg"
    sed "s/fill:#e0e3ff/fill:$INNER_COLOR;stroke:none;fill-opacity:1/" "$temp_svg" > "$temp_svg.tmp" && mv "$temp_svg.tmp" "$temp_svg"

    SIZES=(16 32 48 64 128 256 512 1024)
    for SZ in "${SIZES[@]}"; do
        DEST="$OUT/icons/hicolor/${SZ}x${SZ}/apps"
        mkdir -p "$DEST"
        magick -background none "$temp_svg" -resize "${SZ}x${SZ}" "$DEST/$output_name.png" || {
            echo "Error: Failed to generate $DEST/$output_name.png"
            exit 1
        }
        optipng -o7 -quiet "$DEST/$output_name.png"
    done

    TRAY_DEST="$OUT/static/tray"
    mkdir -p "$TRAY_DEST"
    magick -background none "$temp_svg" -resize "64x64" "$TRAY_DEST/tray.png" || {
        echo "Error: Failed to generate $TRAY_DEST/tray.png"
        exit 1
    }
    optipng -o7 -quiet "$TRAY_DEST/tray.png"

    mkdir -p "$OUT/static"
    magick -background none "$temp_svg" -resize 1080x1080 "$OUT/static/$output_name.png" || {
        echo "Error: Failed to generate $OUT/static/$output_name.png"
        exit 1
    }
    optipng -o7 -quiet "$OUT/static/$output_name.png"

    rm "$temp_svg"
}

process_svg_notification() {
    local src_file="$1"
    local output_name="$2"
    local temp_svg="temp-$output_name.svg"

    cp "$src_file" "$temp_svg"
    sed "s/fill:#5865f2/fill:$OUTER_COLOR/" "$temp_svg" > "$temp_svg.tmp" && mv "$temp_svg.tmp" "$temp_svg"
    sed "s/fill:#e0e3ff/fill:$INNER_COLOR;stroke:none;fill-opacity:1/" "$temp_svg" > "$temp_svg.tmp" && mv "$temp_svg.tmp" "$temp_svg"

    TRAY_DEST="$OUT/static/tray"
    mkdir -p "$TRAY_DEST"
    magick -background none "$temp_svg" -resize "64x64" "$TRAY_DEST/$output_name.png" || {
        echo "Error: Failed to generate $TRAY_DEST/$output_name.png"
        exit 1
    }
    optipng -o7 -quiet "$TRAY_DEST/$output_name.png"

    mkdir -p "$OUT/static"
    magick -background none "$temp_svg" -resize 1080x1080 "$OUT/static/$output_name.png" || {
        echo "Error: Failed to generate $OUT/static/$output_name.png"
        exit 1
    }
    optipng -o7 -quiet "$OUT/static/$output_name.png"

    rm "$temp_svg"
}

process_svg_with_hicolor "$SRC" "vesktop"

process_svg_notification "$SRC_NOTIFICATION" "trayUnread"

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

#New upstream stopped using a gif. sadge. 
#cp "loader.gif" "$OUT/static/shiggy.gif"

echo "Icons generated in $OUT"