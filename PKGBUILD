# Maintainer: Giulio Girardi <giulio at rapgenic.it>

pkgname=cinnamon-remove-application
pkgver=0.0.3
pkgrel=1
pkgdesc="Arch linux version of cinnamon-remove-application (enables the uninstall option in the right click Cinnamon application menu)"
arch=('any')
url="https://github.com/rapgenic/cinnamon-remove-application"
license=('GPL2')
source=("https://github.com/rapgenic/${pkgname}/archive/${pkgver}.zip")
md5sums=('9cffd6cb171dbb3cfcc1c4f01bfd3d78')
depends=('cinnamon')

package() {
  install -Dm0755 "$srcdir/${pkgname}-${pkgver}/usr/bin/cinnamon-remove-application" "$pkgdir/usr/bin/cinnamon-remove-application"
}
