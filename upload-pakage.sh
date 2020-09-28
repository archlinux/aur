#!/bin/bash

makepkg --printsrcinfo > .SRCINFO
git add .
git status
echo "Write your commit comment: "
read -r COMMENT
git commit -m "${COMMENT}"
git push
