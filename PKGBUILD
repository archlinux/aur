# Maintainer: Rémi Casanova <kh3phr3n@nixsys.fr>

pkgname=xcursor-oxygen
pkgver=5.23.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://invent.kde.org/plasma/oxygen"

sha256sums=("2ea0ca8d889cc10f0d3c60217655b35b8417347243af9239a6b6998bb20bb237")
source=("https://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

