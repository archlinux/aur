# /bin/bash
set -e
rm -rf src
rm -rf pkg
rm -rf local-php-security-checker*
updpkgsums
makepkg -si
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/local-php-security-checker.git
git push arch