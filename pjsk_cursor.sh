#!/bin/bash

declare -r -a ORIGIN_LINKS=(
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation-VirtualSinger.zip"
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-VirtualSinger.zip"
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation-leoneed.zip"
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-leoneed.zip"
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation-MMJ.zip"
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-MMJ.zip"
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation-VBS.zip"
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-VBS.zip"
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation%20WxS.zip" # WTF, WHY %20 IS HERE?
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-WxS.zip"
    "https://colorfulstage.com/upload_images/media/Download/ani%20file-animation-N25.zip"
    "https://colorfulstage.com/upload_images/media/Download/cur%20file-static-N25.zip"
)

ANI_SUFFIX=".ani"
CUR_SUFFIX=".cur"

LINE1="[Icon Theme]"
NAME_PREFIX="Name=PJSK"
DESCRIPTION="Comment=Project Sekai Cursors, From https://colorfulstage.com/media/download/"
ANIMATION_NAME_SUFFIX="Animation"
STATIC_NAME_SUFFIX="Static"

# https://github.com/SystemRage/Metamorphosis/blob/master/Metamorphosis.py#L111-L205
# This map is used to convert PJSK cursor names to X cursor names.
declare -A PJSK_TO_X_MAP=(
    # AppStarting
    ["Working"]="progress left_ptr_watch"
    # Arrow
    ["Normal"]="default arrow top-left-arrow top_left_arrow left_ptr x-cursor X_cursor"
    # Help
    ["Help"]="ask dnd-ask help question_arrow whats_this left_ptr_help"
    # Wait
    ["Busy"]="wait watch"
    # Crosshair
    ["Precision"]="crosshair cross diamond_cross cross_reverse tcross"
    # IBeam
    ["Text"]="text xterm ibeam vertical-text"
    # NWPen
    ["Handwriting"]="pencil"
    # No
    ["Unavailable"]="no-drop dnd-none circle not-allowed crossed_circle forbidden pirate"
    # SizeNS + SizeS
    ["Vertical"]="col-resize sb_v_double_arrow split_v n-resize s-resize top_side ns-resize v_double_arrow size_ver top-tee top_tee double_arrow double-arrow up sb_up_arrow bottom-tee bottom_side bottom_tee sb_down_arrow down"
    # SizeWE + SizeE
    ["Horizontal"]="ew-resize h_double_arrow size_hor left sb_left_arrow left-tee left_tee row-resize sb_h_double_arrow split_h w-resize e-resize left_side right_side right sb_right_arrow right-tee right_tee"
    # SizeNWSE + SizeSE
    ["Diagonal1"]="nw-resize top_left_corner ul_angle nwse-resize fd_double_arrow size_fdiag se-resize lr_angle bottom_right_corner"
    # SizeNESW + SizeSW
    ["Diagonal2"]="ne-resize top_right_corner ur_angle nesw-resize bd_double_arrow size_bdiag sw-resize ll_angle bottom_left_corner"
    # SizeAll
    ["Move"]="cell plus all-scroll fleur size_all"
    # Hand
    ["Link"]="alias link dnd-link left-hand hand1 pointer hand2 grab grabbing pointing_hand openhand hand"
    # UpArrow
    ["Alternate"]="top-right-arrow right_ptr move dnd-move draft_large draft_small up-arrow up_arrow center_ptr"
    # Person
    ["Person"]=""
    # Pin
    ["Pin"]=""
)

download_cursors() {
    mkdir -p source
    cd source
    for url in "${ORIGIN_LINKS[@]}"; do
        raw=$(basename "$url")
        fname=${raw//%20/-}
        [ -f "$fname" ] || wget -q -O "$fname" "$url"
        dir=${fname%.zip}
        mkdir -p "$dir"
        unzip -o "$fname" -d "$dir" '*.ani' '*.cur'
    done
    cd - >/dev/null
}

convert_cursors() {
    for theme_dir in source/*; do
        [ -d "$theme_dir" ] || continue
        theme=$(basename "$theme_dir")
        mkdir -p "output/$theme"

        if [[ "$theme" == ani* ]]; then
            files=("$theme_dir"/*.ani)
        else
            files=("$theme_dir"/*.cur)
        fi
        win2xcur "${files[@]}" -o "output/$theme/"

        for src in output/"$theme"/*; do
            [ -f "$src" ] || continue
            name=${src##*/}
            aliases=${PJSK_TO_X_MAP[$name]}
            [ -z "$aliases" ] && continue
            for alias in $aliases; do
                cp "$src" "output/$theme/${alias}"
            done
            rm "$src"
        done
    done
}

package_themes() {
    mkdir -p packaged
    for theme_dir in output/*; do
        [ -d "$theme_dir" ] || continue
        dir=$(basename "$theme_dir")

        base=${dir##*-}

        if [[ "$dir" == ani* ]]; then
            suffix="Animated"
        else
            suffix="Static"
        fi
        dest="packaged/PJSK $base $suffix"
        mkdir -p "$dest/cursors"
        cp "$theme_dir"/* "$dest/cursors/"
        cat > "$dest/index.theme" <<EOF
[Icon Theme]
Name=PJSK $base $suffix
Comment=Project Sekai Cursors, From https://colorfulstage.com/media/download/
EOF
    done
}

main() {
    download_cursors
    convert_cursors
    package_themes
}

main "$@"