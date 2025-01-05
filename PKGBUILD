# Maintainer: thorou <thorou@chirality.de>

_pkgname=rism
pkgname=$_pkgname-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Application-specific browser based on tauri"
arch=("x86_64")
url="https://github.com/thorio/rism"
license=("GPL3")
depends=("appmenu-gtk-module" "libappindicator-gtk3" "librsvg" "webkit2gtk-4.1")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/rism-x86_64.deb")
sha256sums=("a587f564a9568e8e789108eeacf94dd6370aa4a63bfbd3b4cfcf2d3d116433f7")

package() {
	tar -C "$pkgdir" -xf data.tar.gz
}
