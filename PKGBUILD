# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Bernhard Walle <bernhard@bwalle.de>

pkgname=cram
pkgver=0.7
pkgrel=3
pkgdesc="functional testing framework for command line applications"
arch=('any')
url="https://bitheap.org/cram/"
license=('GPL2')
depends=('python')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://bitheap.org/cram/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9fa57e504abac8fd15bf5ff4a74405cb7acd10fd4c797adee87052a4f1c4e975bbc0f4219afd9485358b2c2939b48b3ffe538ae2abc6eea71e0ba8b458d50103')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
