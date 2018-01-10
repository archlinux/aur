# Colors

if [[ -z "$WAL" ]]
then
  WAL="$HOME/.cache/wal/colors.sh"
fi

if [[ -f "$WAL" ]]
then
  source "$WAL" && return
fi

# Defaults for if we couldn't source wal's colors.sh
# If you're building in a chroot or container you can
# just replace this file with your own.
color2='#00BCD4'
color4='#00BCD4'
color5='#009688'
color6='#4DB6AC'
