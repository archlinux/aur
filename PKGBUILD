# Maintainer: Hanspeter Porner <dev@open-music-kontrllers.ch>
pkgname=spectmorph
pkgver=0.3.4
pkgrel=1
epoch=
pkgdesc="a free software project which allows to analyze samples of musical instruments, and to combine them (morphing)."
arch=(i686 x86_64 armv7h)
url="http://spectmorph.org/"
license=('LGPL3')
groups=('lv2-plugins')
depends=('fftw' 'qt5-base' 'python' 'libao' 'jack' 'python2')
makedepends=('lv2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://spectmorph.org/downloads/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('9c06694866d8bfedcaf7f2b0f69f2570')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
