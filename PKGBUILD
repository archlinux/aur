# Maintainer: Remi Casanova <rc.dev@tuxico.com>

pkgname=xcursor-oxygen
pkgver=5.6.1
pkgrel=1

arch=('any')
conflicts=('oxygen')
depends=('libxcursor')

license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://quickgit.kde.org/?p=oxygen.git"

sha256sums=("2544e953e7af34a51b8bcd441223e2f2f036a1533c5972c9df7c0e281abdc412")
source=("http://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

