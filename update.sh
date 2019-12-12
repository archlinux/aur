# /bin/bash
set -e
rm -rf src
rm -rf pkg
updpkgsums
makepkg -si
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/symfony-cli.git
git push arch