# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=flash-bio
pkgver=1.2.11
pkgrel=1
pkgdesc='An accurate and fast tool to merge paired-end DNA reads'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
url="https://sourceforge.net/projects/flashpage/"

source=("http://downloads.sourceforge.net/project/flashpage/FLASH-${pkgver}.tar.gz")

build() {
  cd FLASH-${pkgver}
  make
}

package() {
  cd FLASH-${pkgver}
  install -Dm755 flash ${pkgdir}/usr/bin/flash
  install -Dm644 README ${pkgdir}/usr/share/doc/FLASH/README
  install -Dm644 NEWS ${pkgdir}/usr/share/doc/FLASH/NEWS
}

sha1sums=('0df7b2467e5e5d778031ae10dbbd2ed52996a282')
