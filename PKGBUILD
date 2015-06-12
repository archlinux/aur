# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wsdlpull
pkgver=1.24
pkgrel=1
pkgdesc="A C++ web services client library"
arch=('i686' 'x86_64')
url="http://wsdlpull.sourceforge.net/"
license=('LGPL')
groups=()
depends=(curl)
makedepends=(doxygen)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname%20$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install
}

md5sums=('c77e1637ebb113921cb4fa5408bff67b')
