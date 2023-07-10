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
sha256sums=('88029e4d88c313efed973d50c0633c3514d55be5fa5907c7e3fa657f21394fdd')

package() {
  cd "clean-${pkgver}/src"
  install -Dm755 -t "$pkgdir/usr/bin/" clean
}
