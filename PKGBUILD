# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>
# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=anarchism
pkgver=15.1
pkgrel=3
_debpkgrel=7
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
makedepends=(librsvg)
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb)
sha256sums=('f61a4d41c37a301c22dd57c8e5ed40695063cbd9d99d122e736e62e8ccd76b97')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
}
