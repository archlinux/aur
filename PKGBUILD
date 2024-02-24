# Maintainer: thorou <thorou@chirality.de>

_pkgname=rism
pkgname=$_pkgname-bin
pkgver=0.1.0
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
sha256sums=("8bd603f4140752da96a76f6f73bbad9867a8dd4def05582055e01cf651b88c34")

package() {
	tar -C "$pkgdir" -xf data.tar.gz
}
