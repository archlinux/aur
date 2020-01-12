# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>
# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=anarchism
pkgver=15.3
pkgrel=1
_debpkgrel=1
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
makedepends=(librsvg)
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb)
sha256sums=('a6b7299c14b0fa4e88918172987a0516cbaeb13f0a02a2a494b156892337a9b4')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
}
