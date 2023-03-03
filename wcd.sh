wcd() {
  dir=$(mktemp -d)
  script="$dir/wcd.go"

  wcd.exe -G "$dir" "$@"

  [ -f "$script" ] && . "$script"
  rm -rf "$dir" 2>/dev/null
}
