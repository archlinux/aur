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
sha256sums=('6b9acfd491d9cb8b923bd7d0e4b57854ebc2cca78753d546dcde57c3b7a34cfc')

package() {
  cd "clean-${pkgver}/src"
  install -Dm755 -t "$pkgdir/usr/bin/" clean
}
