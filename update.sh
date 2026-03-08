set -euo pipefail

updpkgsums PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git commit -am update
git push

makepkg -si

rm *.tar.* *.zip
