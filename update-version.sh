#wget https://raw.githubusercontent.com/quarto-dev/quarto-web/main/docs/download/_prerelease.json

version=$(jq -r '.version' _prerelease.json)
echo $version
sed -i "s/^pkgver=.*/pkgver=${version}/" PKGBUILD

checksum=$(jq -r '.assets[2].checksum' _prerelease.json)
sed -i "s/^sha256sums=('.*/sha256sums=('${checksum}')/" PKGBUILD


makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Pre-release version $version"
git push aur master