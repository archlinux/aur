# Maintainer: Mathieu Westphal <mathieu.westphal@gmail.com>

pkgname=python2-spidev
pkgver=3.1
pkgrel=1
pkgdesc="Python2 bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h')
url="https://pypi.python.org/packages/source/s/spidev/"
license=('GPL')
depends=('python2')
makedepends=('git')
source=("https://pypi.python.org/packages/source/s/spidev/spidev-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/spidev-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/spidev-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
