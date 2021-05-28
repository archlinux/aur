# Maintainer: Rémi Casanova <kh3phr3n@nixsys.fr>

pkgname=xcursor-oxygen
pkgver=5.21.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://invent.kde.org/plasma/oxygen"

sha256sums=("8fc30be19b5bbb10f294329733178620de7dd8ac3f6715177925145a64fbabe8")
source=("https://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

