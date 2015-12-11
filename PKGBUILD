# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=arc
pkgver=5.21p
pkgrel=3
pkgdesc="Arc file archiver and compressor. Long since superceeded by zip/unzip but useful if have old .arc files need to unpack."
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/arc'
license=('GPL')
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('e68e358b86a67c68e8a1cb95a840f380bfda3684')


build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make -C "${pkgname}-${pkgver}" PREFIX=/usr DESTDIR="${pkgdir}" install
}
