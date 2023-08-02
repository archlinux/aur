# Maintainer: Devin Hill lvlrk4u@proton.me
pkgname='fmon'
pkgver=1.4
pkgrel=1
pkgdesc="A quick, easy, and multi-threaded
method to poll file modification."
arch=('any')
url="https://github.com/lvlrk/fmon"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='.INSTALL'
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(3db1a4f4fb0a456dc65a41746e702b9e)

build() {
    cd "$pkgname-$pkgver"
    make clean all
}

package() {
    cd "$pkgname-$pkgver"
	sudo make clean DESTDIR="$pkgdir/" install lib-install
}
