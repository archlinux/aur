lastVer=$(curl -s "https://api.github.com/repos/Blaadick/BlaadPapers/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
description=$(curl -s "https://api.github.com/repos/Blaadick/BlaadPapers" | jq -r '.description')

curl -s -L "https://github.com/Blaadick/BlaadPapers/archive/refs/tags/v$lastVer.tar.gz" -o "blaadpapers-$lastVer.tar.gz"
sha256sum=$(sha256sum "blaadpapers-$lastVer.tar.gz" | cut -d ' ' -f1)
rm "blaadpapers-$lastVer.tar.gz"

sed -i -E "s/^pkgver=.*/pkgver='$lastVer'/" PKGBUILD
sed -i -E "s/^pkgdesc=.*/pkgdesc='$description'/" PKGBUILD
sed -i -E "s/^sha256sums=.*/sha256sums=('$sha256sum')/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "Update to $lastVer"
git push
