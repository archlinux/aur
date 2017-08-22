# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>

pkgname=ozon-icon-theme
pkgver=0.3
_pkgname=ozon-icon-theme-$pkgver
pkgrel=2
pkgdesc="Ozon OS default icon set"
arch=('any')
url="https://github.com/ozonos/ozon-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache')
provides=('ozon-icon-theme')
conflicts=('ozon-icon-theme')
source=('https://github.com/ozonos/ozon-icon-theme/archive/v0.3.tar.gz')
sha256sums=('d3fb3443c861283ac7bd6a318a74bad38f0206f39d3add4e36299d71326bc24d')

package() {

  # create icon theme dir
  install -d -m 755 "$pkgdir"/usr/share/icons/Ozon

  # install icon theme
  cd $srcdir/$_pkgname/Ozon
  cp -dr --no-preserve='ownership' ./ "$pkgdir"/usr/share/icons/Ozon
}