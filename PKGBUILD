# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>

pkgname=clean
pkgver=2.1
pkgrel=1
pkgdesc="Command for cleaning orphans, cache, trash"
arch=('any')
url="https://github.com/architalia/clean"
license=('GPL3')
depends=('bash' 'bc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ArchItalia/clean/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46f1fa1efa583a581d85e59b5cb46467e85f9cc506dcd97832e96f48550101c0  clean')

package() {
  cd "clean-${pkgver}/src"
  install -Dm755 -t "$pkgdir/usr/bin/" clean
}
