# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=libsphinx
pkgver=1.0.2
pkgrel=1
pkgdesc="Sphinx-based Password Storage low-level library"
arch=(i686 x86_64)
url='https://github.com/stef/libsphinx'
license=('GPL3')
depends=('libsodium')
source=(https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('5cfb0e16bad613e800d375667b89e377')

build(){
cd "$pkgname-$pkgver/src"
make
}
package(){
cd "$pkgname-$pkgver/src"
make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

