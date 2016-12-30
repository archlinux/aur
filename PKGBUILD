# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
_shortname=easylogging
pkgname=${_shortname}pp
pkgver=9.88
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
source=("https://github.com/${_shortname}/${pkgname}/releases/download/${pkgver}/${pkgname}_v${pkgver}.tar.gz")
noextract=()
sha1sums=('9f465090d725508ef41779ca77c6d92894677caf')

package() {
    install -Dm644 "${srcdir}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/easylogging++.h" "${pkgdir}/usr/include/easylogging++.h"
    install -Dm644 "${srcdir}/RELEASE-NOTES.txt" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE-NOTES"
}
