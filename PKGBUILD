# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.1.0
pkgrel=3
pkgdesc="A translucent theme for Plasma 5."
arch=('any')
url="https://www.opendesktop.org/p/998869/"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=('Helium.tar.gz')
md5sums=('67c1164605e18ac1b7e08469eaec84b2')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"

  cp -r --no-preserve=mode,ownership "${srcdir}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
