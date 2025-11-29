#!/bin/sh

add_mime_type() {
  if ! grep -q -E "^MimeType=.*\b${1};" "$2"; then
    sed -i -E "s#^(MimeType=.*;)\$#\1${1};#" "$2"
  fi
}

# see https://github.com/microsoft/vscode/issues/15741
fix_15741() {
  add_mime_type 'inode/directory' "$1"
}

# see https://github.com/microsoft/vscode/issues/214741
fix_214741() {
  add_mime_type 'text/plain' "$1"
}

while read -r file; do
  case "${file}" in
    *.desktop)
      fix_214741 "${file}"
      fix_15741 "${file}"
      echo "patched ${file}"
      ;;
    *)
      echo "unexpected file: ${file}"
      ;;
  esac
done
