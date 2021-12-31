#!/bin/bash
filename=$1
comment=$2
if [[ "$filename" = "help" ]]; then echo "aurhelper {filename} {comment(\"git commit [filename]\")} (if you have more than one file - add it manually) How to use aur: 1. git clone ssh://aur@aur.archlinux.org/[your project name].git 2. cd [your project name] 3. copy files (project files(.sh etc.) and PKGBUILD) 4. run aurhelper"
elif [ -z $filename ] || [ -z $comment ]; then echo "You need to write .sh file name or comment (2nd option) or use aurhelper help"; else
rm -rf .SRCINFO
makepkg --printsrcinfo > .SRCINFO
git add $filename .SRCINFO PKGBUILD
git commit -m "$comment"
git push origin master
fi
