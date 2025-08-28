#!/bin/bash

monitors=$(wlr-randr --json | jq '.[] | .name')
windows="${XDPH_WINDOW_SHARING_LIST}"

result=""

# shamelessly stolen from uwsm/uuctl
if [ "$#" -le "1" ]; then
    dmenu_candidates="walker fuzzel wofi rofi tofi bemenu wmenu dmenu"

    if [ "$#" = "1" ]; then
        case " $dmenu_candidates " in
        *" $1 "*) true ;;
        *)
            {
                echo "Supported menu tools: $dmenu_candidates"
                echo "'$1' is not among them. Provide its full command line ending with prompt argument"
                echo "(-p or analogous)"
            } >&2
            exit 1
            ;;
        esac
    fi

    for dmenu_candidate in $1 $dmenu_candidates; do
        ! command -v "$dmenu_candidate" >/dev/null || break
    done

    case "$dmenu_candidate" in
    walker)
        set -- walker -d -p
        ;;
    fuzzel)
        set -- fuzzel --dmenu -R --log-no-syslog --log-level=warning -p
        ;;
    wofi)
        set -- wofi --dmenu -p
        ;;
    rofi)
        set -- rofi -dmenu -p
        ;;
    tofi)
        set -- tofi --prompt-text
        ;;
    bemenu)
        set -- bemenu -p
        ;;
    wmenu)
        set -- wmenu -p
        ;;
    dmenu)
        set -- dmenu -p
        ;;
    '' | *)
        # shellcheck disable=SC2086
        echo "Could not find a menu tool among:" $dmenu_candidates
        exit 1
        ;;
    esac
else
    if ! command -v "$1" >/dev/null; then
        echo "Menu tool '$1' not found" >&2
        exit 1
    fi
fi

# Add monitors to result
while IFS= read -r monitor; do
    monitor=$(echo "$monitor" | tr -d '"') # Remove quotes from monitor name
    if [ -n "$result" ]; then
        result="${result}\n"
    fi
    result="${result}${monitor}\tscreen: ${monitor}"
done <<<"$monitors"

# Add region entry
if [ -n "$result" ]; then
    result="${result}\n"
fi
result="${result}region\tregion: select"

# Add windows to result
parse_windows() {
    local windows="$1"

    echo "$windows" | awk -F'\\[HA>\\]' '{
        for(i=1; i<=NF; i++) {
            if ($i == "") continue;

            entry = $i;

            # Split by [HC>] to get ID and rest
            if (split(entry, parts1, "\\[HC>\\]") >= 2) {
                id = parts1[1];
                rest = parts1[2];

                # Split by [HT>] to get client and title part
                if (split(rest, parts2, "\\[HT>\\]") >= 2) {
                    client = parts2[1];
                    title_part = parts2[2];

                    # Extract title (before [HE>])
                    if (split(title_part, parts3, "\\[HE>\\]") >= 1) {
                        title = parts3[1];

                        if (id != "" && title != "")
                            print "window:"id "\t" "window: " title;
                    }
                }
            }
        }
    }'
}

while IFS= read -r line; do
    if [ -n "$result" ]; then
        result="${result}\n"
    fi
    result="${result}${line}"
done < <(parse_windows "$windows")

labels=$(echo -e "$result" | cut -f2)
selection=$(echo -e "$labels" | "$@" "Select")
selected_value=$(echo -e "$result" | awk -F'\t' -v sel="$selection" '$2 == sel {print; exit}')

if [[ $selected_value == *"screen"* ]]; then
    monitor=$(echo "$selected_value" | cut -f1)
    echo "[SELECTION]/screen:${monitor}"
elif [[ $selected_value == *"window"* ]]; then
    window_id=$(echo "$selected_value" | cut -f1)
    echo "[SELECTION]/${window_id}"
elif [[ $selected_value == *"region"* ]]; then
    region=$(slurp -f "%o@%x,%y,%w,%h")
    echo "[SELECTION]/region:${region}"
fi
