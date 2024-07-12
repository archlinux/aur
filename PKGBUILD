# Maintainer: thorou <thorou@chirality.de>

_pkgname=rism
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Application-specific browser based on tauri"
arch=("x86_64")
url="https://github.com/thorio/rism"
license=("GPL3")
depends=("libappindicator-gtk3" "gtk3" "librsvg" "webkit2gtk" "libsoup")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/rism-x86_64.deb")
sha256sums=("ab57d5262506e627ef30fcea9d47f8137fc34cba9cd7a8ae5fff32d7418d323a")

package() {
	tar -C "$pkgdir" -xf data.tar.gz
}
