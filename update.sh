# /bin/bash
set -e
rm -rf src
rm -rf pkg
rm -rf font*
updpkgsums
makepkg -si
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/font-validator.git
git push arch