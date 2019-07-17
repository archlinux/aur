# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>
# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=anarchism
pkgver=15.1
pkgrel=5
_debpkgrel=10
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
makedepends=(librsvg)
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb)
sha256sums=('de064ee64d0dfb97c2f3d12bcf41edb621db758c44fa2c2a2f6eb03a14a95f9c')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
}
