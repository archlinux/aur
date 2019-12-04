# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.13
pkgrel=1
pkgdesc="A translucent theme for Plasma 5."
arch=('any')
url="https://www.opendesktop.org/p/998869/"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=('Helium-20191201175356.tar.gz')
md5sums=('262024f4f66f5933ef1ea8b3e0abded7')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"

  cp -r --no-preserve=mode,ownership "${srcdir}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
