# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=easyloggingpp
pkgver=9.80
pkgrel=1
pkgdesc='Robust, thread-safe lightweight single header only C++ logging library'
arch=('any')
url='https://github.com/easylogging/easyloggingpp'
license=('custom')
groups=()
depends=()
makedepends=()
optdepends=('gcc: compiler that supports C++11')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/easylogging/easyloggingpp/v${pkgver}/src/easylogging++.h"
        "https://raw.githubusercontent.com/easylogging/easyloggingpp/v${pkgver}/LICENCE")
noextract=()
sha1sums=('8d9cb14c96f3f12bf5fbfd4e7d7f4b6f8d1e21b3'
          'e6539fb007f23ea9dd9582c0780e87ee5aafb28c')

package() {
    install -Dm644 ${srcdir}/LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/easylogging++.h ${pkgdir}/usr/include/easylogging++.h
}
