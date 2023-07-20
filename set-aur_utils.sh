#!/bin/bash
ADDONS=("archives" "fabric" "forge" "quilt")
for addon in "${ADDONS[@]}"; do 
  version="$(grep 'version =' "lib/$addon/pyproject.toml" | cut -d'"' -f2)"
  summary="$(grep 'description =' "lib/$addon/pyproject.toml" | cut -d'"' -f2)"
  authors="$(grep 'authors =' "lib/$addon/pyproject.toml" | cut -d'=' -f2)"
  sed -i -f <(cat <<EOF
    s/$addon-version/$version/;
    s/$addon-summary/$summary/;
    s/\["$addon-authors"\]/$authors/;
EOF
  ) lib/aur_utils.py
done
