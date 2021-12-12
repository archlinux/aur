#!/bin/bash
makepkg --printsrcinfo > .SRCINFO
git add .

echo "Write commit comment!"
read input

git commit -m "$input"
git push -u origin master