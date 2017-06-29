# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
_shortname=easylogging
pkgname=${_shortname}pp
pkgver=9.94.2
pkgrel=1
pkgdesc='Robust, thread-safe lightweight single header only C++ logging library'
arch=('any')
url="https://github.com/${_shortname}/${pkgname}"
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
source=("https://github.com/${_shortname}/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz")
noextract=()
sha1sums=('fbd4ac4d3c2b7a341c3d88c6e5d47a6cd79303d7')

package() {
    install -Dm644 "${srcdir}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/easylogging++.h" "${pkgdir}/usr/include/easylogging++.h"
    install -Dm644 "${srcdir}/easylogging++.cc" "${pkgdir}/usr/include/easylogging++.cc"
    install -Dm644 "${srcdir}/CHANGELOG.txt" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
