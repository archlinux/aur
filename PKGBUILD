# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=028
pkgrel=1
pkgdesc='Console client for Twitter and identi.ca'
arch=('i686' 'x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth')

md5sums=('c858d41efe1e14b1891517092d4b112e')
source=("http://www.kernel.org/pub/software/web/bti/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make; make DESTDIR=$pkgdir install
}
