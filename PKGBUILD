# Maintainer: archlinux.info:tdy

pkgname=vitables
pkgver=2.1
pkgrel=1
pkgdesc="A GUI browser and editor for PyTables/HDF5 files"
arch=(any)
url=http://vitables.org
license=(GPL3)
depends=(python2-pyqt4 python2-pytables)
makedepends=(python2-sphinx)
source=(https://downloads.sourceforge.net/$pkgname/ViTables-$pkgver.tar.gz)
sha256sums=(f0413fa725617fbb3f0be03cb1f41b5b841c6946098a629f3fcb8a99fb9be14a)

build() {
  cd ViTables-$pkgver
  python2 setup.py build
}

package() {
  cd ViTables-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
