# Maintainer: Your Name <ioan.coleman@gmail.com>
pkgname=ioanaur
pkgver=1
pkgrel=1
epoch=
pkgdesc="Description here"
arch=('any')
url="https://ioan.cc"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/ioancole/ioanaur101/master/aprogram.sh")
noextract=()
md5sums=('c08b6d884be68857132d67a185c562a5')
validpgpkeys=()

package() {
	cd "$(pkgname)-$(pkgver)"
	install -Dm755 aprogram.sh "$pkgdir/usr/bin/aprogram"
}
