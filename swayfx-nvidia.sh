#!/usr/bin/env sh

# Source profile (lifted from some gnome stuff)
if [ "x$XDG_SESSION_TYPE" = "xwayland" ] &&
   [ "x$XDG_SESSION_CLASS" != "xgreeter" ] &&
   [  -n "$SHELL" ] &&
   grep -q "$SHELL" /etc/shells &&
   ! (echo "$SHELL" | grep -q "false") &&
   ! (echo "$SHELL" | grep -q "nologin"); then
  if [ "$1" != '-l' ]; then
    exec bash -c "exec -l '$SHELL' -c '$0 -l $*'"
  else
    shift
  fi
fi

# Source environment files
for n in "/usr/share" "/usr/local/share"; do
  [ -f "$n/wlroots-nvidia/wlroots-env-nvidia.sh" ] && . "$n/wlroots-nvidia/wlroots-env-nvidia.sh"
  [ -f "$n/wlroots-nvidia/wlroots-env.sh" ] && . "$n/wlroots-nvidia/wlroots-env.sh"
done

# noscanout fixes this issue: https://www.reddit.com/r/swaywm/comments/wiq06i/games_have_lines_on_screen_when_fullscreen_on/
exec sway --unsupported-gpu -D noscanout "$@"
