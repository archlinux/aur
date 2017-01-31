#!/bin/bash
#set -e

cmd="$(basename "$0")"

# From the scrot manpage:
# -u, --focused
#      Use the currently focused window.

[[ "$cmd" =~ .*-window ]] && scrot_args="-u"

case "$cmd" in

  copy-*|save-*)
    tmp_file="$(mktemp --suffix=.png)"
    scrot $scrot_args "$tmp_file"
    ;;&

  copy-*)
    xclip -selection clipboard -t image/png -in < "$tmp_file"
    rm "$tmp_file"
    ;;

  save-*)
    target_file="$HOME/$(date +%s)"

    # Make sure we don't overwrite existing files.
    while ! (set -o noclobber; { > "${target_file}.png" ; } 2>/dev/null); do
      target_file="${target_file}-"
    done

    mv "$tmp_file" "${target_file}.png"
    ;;

  *)
    >&2 echo "$cmd: invalid program name"
    exit 1
    ;;
esac

case "$cmd" in
  save-window) msg="Current window saved." ;;
  copy-window) msg="Current window copied." ;;
  save-screen) msg="Whole screen saved." ;;
  copy-screen) msg="Whole screen copied." ;;
esac

type notify-send >/dev/null 2>&1 && notify-send "$msg"
