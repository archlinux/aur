#!/usr/bin/env sh
found=0
IFS=''
cat PKGBUILD | while read line; do
  if [[ found -eq 0 ]]; then
    if [[ "$line" == pkgname=* ]]; then
      echo "#==> Auto-generated file from PKGBUILD <==#" > .install
      echo $line >> .install
    elif [ "$line" = "#==> Custom <==#" ]; then
      found=1
    fi
  else
    if [[ "$line" == _remove_package* ]]; then
      echo "post_remove() {" >> .install
    elif [ "$line" != "#==> End of custom <==#" ]; then
      echo $line >> .install
    else
      break
    fi
  fi
done
if [[ found -eq 1 ]]; then
  echo "Error parsing PKGBUILD"
  exit 1
fi
