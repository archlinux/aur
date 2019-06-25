# Maintainer: Remi Casanova <rc.dev@tuxico.com>

pkgname=xcursor-oxygen
pkgver=5.16.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://cgit.kde.org/oxygen.git"

sha256sums=("89adb92e2c6cd77b21d7fa5cd42963637919dc7d472254cf684db5374a36d567")
source=("https://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

