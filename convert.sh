#!/bin/bash
# coding=utf-8

# $1 configname

source "$1".sh
destdir="$1"

mapping=("default ${default}"
    "progress ${progress}"
    "wait ${wait}"
    "crosshair ${crosshair}"
    "text ${text}"
    "ns-resize ${ns__resize}"
    "ew-resize ${ew__resize}"
    "nwse-resize ${nwse__resize}"
    "nesw-resize ${nesw__resize}"
    "grab ${grab}"
    "grabbing ${grabbing}"
    "right_ptr ${right_ptr}"
    "pointer ${pointer}"
    "help ${help}"
    "move ${move}"
    "not-allowed ${not__allowed}"
    "link ${link}"
)

mkdir -p "${destdir}/cursors"

for i in "${mapping[@]}"; do
    dest=${i%% *}
    orig=${i#* }
    # Extract the cursor name
    [[ -z "$orig" ]] || cp "output/${orig}" "${destdir}/cursors/${dest}"
done

# mapping missing cursors, adapted from adwaita and breeze
mapping=(
    "alias link"
    "arrow default"
    "bd_double_arrow nwse-resize"
    "bottom_left_corner nesw-resize"
    "bottom_right_corner nwse-resize"
    "bottom_side ns-resize"
    "cell crosshair"
    "col-resize ew-resize"
    "cross crosshair"
    "cross_reverse crosshair"
    "diamond_cross crosshair"
    "dnd-move grabbing"
    "e-resize ew-resize"
    "fd_double_arrow nesw-resize"
    "fleur move"
    "hand1 grab"
    "hand2 pointer"
    "ibeam text"
    "left_ptr default"
    "left_ptr_watch progress"
    "left_side ew-resize"
    "n-resize ns-resize"
    "ne-resize nesw-resize"
    "no-drop not-allowed"
    "nw-resize nwse-resize"
    "question_arrow help"
    "right_side ew-resize"
    "row-resize ns-resize"
    "s-resize ns-resize"
    "sb_h_double_arrow ew-resize"
    "sb_v_double_arrow ns-resize"
    "se-resize nwse-resize"
    "split_h ew-resize"
    "split_v ns-resize"
    "sw-resize nesw-resize"
    "tcross crosshair"
    "top_left_arrow default"
    "top_left_corner nwse-resize"
    "top_right_corner nesw-resize"
    "top_side ns-resize"
    "v_double_arrow ns-resize"
    "w-resize ew-resize"
    "watch wait"
    "xterm text"
)

for i in "${mapping[@]}"; do
    # Split the string into key and value
    orig=${i%% *}
    dest=${i##* }
    # make sure the destination cursor exists
    [[ -f "${destdir}/cursors/${dest}" ]] && ln -s "$dest" "${destdir}/cursors/${orig}"
done

cat > "${destdir}/index.theme" <<EOF
# Original work published underCC-BY-NC-SA-3.0
[Icon Theme]
Name=${name}
Comment=${name} Cursor Theme, originally by SamToki, xcursor port.
Name[zh_CN]=${name_zh_CN}
Comment[zh_CN]=${name_zh_CN} 光标主题，SamToki 原作，xcursor 移植版。
Name[zh_TW]=${name_zh_TW}
Comment[zh_TW]=${name_zh_TW} 游標主題，SamToki 原作，xcursor 移植版。
Name[ja]=${name_ja}
Comment[ja]=${name_ja} カーソルテーマ、SamToki 原作、xcursor ポート。
Name[es]=${name}
Comment[es]=Tema de cursor de ${name}, obra original por SamToki, portado a xcursor.
Name[ca]=${name}
Comment[ca]=Tema de cursor de ${name}, originalment per SamToki, portat a xcursor.
EOF