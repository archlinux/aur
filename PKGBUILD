pkgname=libesedb
pkgver=20140803
pkgrel=1
pkgdesc="Library and tools to access the Extensible Storage Engine (ESE) Database File (EDB) format."
url="http://code.google.com/p/libesedb/"
arch=('any')
license=('LGPL')
depends=(glibc)
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("https://255adcba056b7d59fd55a94f0ea02de0cf110bfb.googledrive.com/host/0B3fBvzttpiiSN082cmxsbHB0anc/libesedb-experimental-20140803.tar.gz")
sha1sums=('9ba9e56ad3822dd32942a62d7f162e9910a3ef08')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
