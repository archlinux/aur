# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=031
pkgrel=1
pkgdesc='Console client for Twitter and identi.ca'
arch=('i686' 'x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth')

md5sums=('9f79fcd398fe1df5bdffeb28b42f3433')
source=("http://www.kernel.org/pub/software/web/bti/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make; make DESTDIR=$pkgdir install
}
