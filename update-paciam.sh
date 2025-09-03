#!/bin/bash

updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Updated paciam"
git push --set-upstream origin master