#!/usr/bin/env bash

CACHE_FILE="${HOME}/.cache/i3-lru-order"

# 1) If the file doesn't exist, or is empty, bail.
[ -f "${CACHE_FILE}" ] || exit 0

# Read the entire i3 tree JSON just once.
i3_tree_json="$(i3-msg -t get_tree)"

# Build a mapping of con_id (as a string) -> label.
mapped_windows="$(
	echo "$i3_tree_json" | jq -r '
    def descend: recurse(.nodes[], .floating_nodes[]);
    descend
    | select(.window_properties? or .window?)
    | [
        (.id|tostring),
        (
          if .window_properties? and .window_properties.class? then
            "\(.name) (\(.window_properties.class))"
          else
            .name // ""
          end
        )
      ]
      | @tsv
  '
)"

declare -A id_to_label
while IFS=$'\t' read -r con_id con_label; do
	id_to_label["$con_id"]="$con_label"
done <<<"$mapped_windows"

# Build a list of valid labels in LRU order
declare -a valid_labels=()

while IFS= read -r wid; do
	[ -z "$wid" ] && continue
	label="${id_to_label["$wid"]}"
	[ -z "$label" ] && continue
	valid_labels+=("$label")
done <"$CACHE_FILE"

# If no valid windows remain, exit silently.
[ ${#valid_labels[@]} -eq 0 ] && exit 0

# Show them in rofi, with the second item (row index 1) selected by default.
# If there's only 1 item, rofi will silently fall back to row 0.
selection="$(
	printf '%s\n' "${valid_labels[@]}" |
		rofi -dmenu -i -p "Switch to" -selected-row 1
)"

# If the user canceled or made no selection, exit.
[ -z "$selection" ] && exit 0

# Reverse lookup: label -> ID
selected_id=""
for con_id in "${!id_to_label[@]}"; do
	if [[ "${id_to_label["$con_id"]}" == "$selection" ]]; then
		selected_id="$con_id"
		break
	fi
done

# Focus the chosen window
[ -n "$selected_id" ] && i3-msg "[con_id=\"${selected_id}\"] focus" >/dev/null
