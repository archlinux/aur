# Maintainer: Remi Casanova <rc.dev@tuxico.com>

pkgname=xcursor-oxygen
pkgver=5.9.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://cgit.kde.org/oxygen.git"

sha256sums=("b1e19a955f3908ed8fe7ad9be31811ccd05382bdc943bc22f40d1528bd3994ae")
source=("http://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

