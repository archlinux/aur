# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=pyxolotl
pkgver=0.2
pkgrel=1
pkgdesc="Send and receive messages encrypted with Axolotl (Double Ratchet) protocol"
arch=('any')
url="https://github.com/xmikos/pyxolotl"
license=('GPL3')
depends=('python-axolotl')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/pyxolotl/archive/v$pkgver.tar.gz)
sha256sums=('70d111434e23073d89cfe0406419c7a65e87221103256a453e7bf8dc67669036')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
