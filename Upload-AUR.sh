#!/bin/bash
makepkg --printsrcinfo > .SRCINFO
git add .
echo "##### COMMIT INFO #####"
read commit_info
git commit -m "$commit_info"
git push
