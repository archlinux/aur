# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.13
pkgrel=2
pkgdesc="A translucent theme for Plasma 5."
arch=('any')
url="https://www.opendesktop.org/p/998869/"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=('Helium.tar.gz')
md5sums=('52b8de7ca511884ad2dac640d67ded18')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"

  cp -r --no-preserve=mode,ownership "${srcdir}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
