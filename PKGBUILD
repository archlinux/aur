# Maintainer: Remi Casanova <rc.dev@tuxico.com>

pkgname=xcursor-oxygen
pkgver=5.13.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://cgit.kde.org/oxygen.git"

sha256sums=("02d1e3902c70dc1aa28fe6a3b75d2aa3fd9e1774f3ea374f59ef764540cd30e4")
source=("http://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

