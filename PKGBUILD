# Maintainer: Bottersnike <bottersnke237@gmail.com>
pkgname=block
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple lockscreen for linux."
arch=('i686' 'x86_64')
url="https://github.com/Bottersnike/block"
license=('MIT')
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bottersnike/block/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('ce253719087018705ca88b524743b1f8')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
