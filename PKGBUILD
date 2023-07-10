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
sha256sums=('fd5d117e98e162886c7782ea2278cb8de2bd1ebabdf6e1914a96991315ca14df')

package() {
  cd "clean-${pkgver}/src"
  install -Dm755 -t "$pkgdir/usr/bin/" clean
}
