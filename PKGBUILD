# Maintainer: Abraham Murciano <abrahammurciano[at]gmail[dot]com>

_theme="Sweet-Arch"
_pkgname="plasma-splash-sweet-arch"
pkgname="$_pkgname-git"
_gitname=$_pkgname
pkgver=1
pkgrel=1
pkgdesc="A sweet splash screen for KDE Plasma."
arch=("any")
url="https://github.com/abrahammurciano/$_gitname"
license=("GPL")
depends=("plasma-desktop")
makedepends=("git")
source=("git://github.com/abrahammurciano/$_gitname.git")
sha256sums=("SKIP")


package() {
	cd "$_gitname"
	mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/"
	cp -dr --no-preserve=ownership "$_theme" "${pkgdir}/usr/share/plasma/look-and-feel/"
}