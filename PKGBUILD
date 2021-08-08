# Maintainer: barfin
pkgname='metro-for-steam-skin'
pkgver=4.4
pkgrel=1
pkgdesc="A new look for the platform you already know and love. Metro is fresh and exciting from the moment you open Steam."
arch=(any)
url="https://github.com/minischetti/metro-for-steam"
license=("MIT")
depends=(steam sssm)
source=(${url}/archive/refs/tags/v${pkgver}.zip)
md5sums=('446b2f1495a5f9877927f9f9fc320fa8')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/metro-for-steam-${pkgver} ${srcdir}/metro-for-steam
  cp -r ${srcdir}/metro-for-steam ${pkgdir}/usr/share/steam/skins
}

