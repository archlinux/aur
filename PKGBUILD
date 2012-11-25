pkgname=libesedb
pkgver=20120102
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
source=("http://libesedb.googlecode.com/files/libesedb-alpha-20120102.tar.gz")
sha1sums=('2aba34b1c9703a28b8913019044efa3ff53428fb')

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
