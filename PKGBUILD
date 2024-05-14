# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=libsphinx
pkgver=1.1.1
pkgrel=3
pkgdesc="Sphinx-based Password Storage low-level library"
arch=(i686 x86_64)
url='https://github.com/stef/libsphinx'
license=('GPL-3.0-or-later')
depends=('glibc' 'libsodium')
source=($pkgname-$pkgver.tar.gz::https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('443476899a9a1d1377a9b99598a7bedd')

build(){
cd "$pkgname-$pkgver/src"
make
}
package(){
cd "$pkgname-$pkgver/src"
make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

