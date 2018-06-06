rm -f *.deb
rm -f *.tar.xz
rm -rf src
rm -rf pkg
git config user.name "Eddie.website"
git config user.email "maintainer@eddie.website"
updpkgsums
makepkg -f
makepkg --printsrcinfo > .SRCINFO
