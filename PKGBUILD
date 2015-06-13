# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=edena
pkgver=3.131028
pkgrel=1
pkgdesc="de novo short reads assembler"
arch=('i686' 'x86_64')
url="http://www.genomic.ch/edena.php"
license=('GPL3')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::http://www.genomic.ch/edena/EdenaV$pkgver.tar.gz)
md5sums=('e2e9797446043bfb522099a5774b8d7a')

build() {
  cd $srcdir/EdenaV$pkgver

  make compile
}

package() {
  cd $srcdir/EdenaV$pkgver

  install -Dm755 src/edena $pkgdir/usr/bin/edena
}
