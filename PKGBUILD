# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=plumed-namd
pkgver=2.4.1
pkgrel=1
pkgdesc="Patches for using Plumed with NAMD"
url="http://www.plumed.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('plumed')
md5sums=('94bd3234b0c2b27b0373422787ece713'
         'c94a2d7edea0e400e7bd14e22b8f96f8')

source=("namd-2.12.config"
        "namd-2.12.diff")

package() {
  cd ${srcdir}

  install -Dm644 namd-2.12.config ${pkgdir}/usr/lib/plumed/patches/namd-2.12.config
  install -Dm644 namd-2.12.diff ${pkgdir}/usr/lib/plumed/patches/namd-2.12.diff
}

