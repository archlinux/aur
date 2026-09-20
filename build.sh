#!/bin/bash
mv .SRCINFO .SRCINFO_old
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
comment=""
while [ -z "$comment" ]; do
  read -p "Enter a commit comment: " comment
  if [ -z "${comment}" ]; then
    echo "Comment cannot be empty. Please try again."
  fi
done
git commit -m "${comment}"
git push