# Maintainer: Tarık Çelik <tarikcelik@tutamail.com>
pkgname=intelmetool
pkgver=1.1
pkgrel=1
_pkgdir=/tmp
pkgdesc='Tool for working with Intel Management Engine'
arch=('x86_64')
depends=('pciutils')
url='https://review.coreboot.org/coreboot'
license=('GPL2')
source=('https://review.coreboot.org')
sha256sums=('SKIP')

build() {
  cd /tmp/coreboot/util/intelmetool
  make
}

package() {
  cd /tmp/coreboot/util/intelmetool
  make DESTDIR="$pkgdir" install
}
