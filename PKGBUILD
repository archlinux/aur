# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-wallpapers
pkgver=2023.7.17
pkgrel=1
pkgdesc="Catalyst Themed Wallpapers"
arch=('any')
url="https://getcatalyst.eu.org"
license=('MIT')
source=("https://github.com/CatalystDevOrg/catalyst-wallpapers/archive/refs/tags/${pkgver}.tar.gz")
md5sums=("e067d1c6bc4393ebd9c56597a19c756d")

package() {
  mkdir -p "$pkgdir/usr/share/wallpapers"
  cp -r "$srcdir/catalyst-wallpapers-${pkgver}/." "$pkgdir/usr/share/wallpapers/Catalyst"
}