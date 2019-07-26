# Maintainer: Ryann Geary <rtgnj42@gmail.com>
pkgname=ginh
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="ginh is not a histogram: visually evaluate your shell usage patterns"
arch=('any')
url="https://github.com/crclark96/ginh"
license=('MIT')
groups=()
depends=('bash')
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
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(46daa1177d019c35b164d5f30bd2e2a8)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install
}
