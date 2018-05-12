# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=easyloggingpp
pkgver=9.96.4
pkgrel=1
pkgdesc='Robust, thread-safe lightweight C++ logging library'
arch=('any')
url="https://github.com/muflihun/${pkgname}"
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
source=("https://github.com/muflihun/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
sha1sums=('90ca248c7b04ee9856630680d1c91d8f7deccd89')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/easylogging++.h" "${pkgdir}/usr/include/easylogging++.h"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/easylogging++.cc" "${pkgdir}/usr/include/easylogging++.cc"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
