# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=omwllf
pkgver=1.0
pkgrel=1
pkgdesc="OpenMW leveled list fixer"
provides=('omwllf')
conflicts=('omwllf')
arch=(any)
url="https://github.com/jmelesky/omwllf"
license=(GPL3)
depends=("python")
makedepends=("python")
source=("https://github.com/jmelesky/omwllf/archive/v$pkgver.tar.gz")
sha512sums=('4c603a94f42ecfd8285c3c22fc5144515ca59659ba71e655a6b018189cff09351414208706ea6b281d31c3efa0c1c82dcc6e84e6a1ff737e0c6554b5c4efe9e0')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/omwllf-$pkgver/omwllf.py $pkgdir/usr/bin/omwllf
}
