pkgname=libesedb
pkgver=20140406
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
source=("https://googledrive.com/host/0B3fBvzttpiiSN082cmxsbHB0anc/libesedb-experimental-20140406.tar.gz")
sha1sums=('4649cdc6798e93b634ebe1e2c99af5c9fa4b5662')

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
