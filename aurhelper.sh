#!/bin/bash
filename=$1
comment=$2
if [ -z $filename ] || [ -z $comment ]; then echo "You need to write .sh file name or comment (2nd option)"; else
rm -rf .SRCINFO
makepkg --printsrcinfo > .SRCINFO
git add $filename .SRCINFO PKGBUILD
git commit -m "$comment"
git push origin master
fi
