# Maintainer: thorou <thorou@chirality.de>

_pkgname=rism
pkgname=$_pkgname-bin
pkgver=0.2.0
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
sha256sums=("fc4450f7500a82daa53881e51b90763174c92ac3303d43d58015ff9c5e439de5")

package() {
	tar -C "$pkgdir" -xf data.tar.gz
}
