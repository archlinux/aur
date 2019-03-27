# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.1.0
pkgrel=1
pkgdesc="Helium is a clear / white theme designed from scratch for Plasma 5"
arch=('any')
url="https://github.com/mcder3/Helium-Plasma-Theme"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("${pkgname}::git+https://github.com/mcder3/Helium-Plasma-Theme.git#commit=3d8c5dfae5437586af60d44a01d5457378f0bf17")
md5sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md/CC BY-SA 4.0 EN.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  mv "${srcdir}/${pkgname}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
