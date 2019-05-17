# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.1.0
pkgrel=2
pkgdesc="Helium is a clear / white theme designed from scratch for Plasma 5"
arch=('any')
url="https://github.com/mcder3/Helium-Plasma-Theme"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("https://dl.opendesktop.org/api/files/download/id/1553266692/s/16c801c070301541d3f0f38373aa3520498831b323f0c8104041e624c8acd55572a8d6269746ada91d5bcac65eb71e8ad34e97e4d00bb563f5bf2bdb4be11125/t/1558127643/lt/download/Helium.tar.gz")
md5sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"

  cp -r --no-preserve=mode,ownership "${srcdir}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
