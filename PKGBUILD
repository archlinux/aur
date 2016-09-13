# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=easyloggingpp
pkgver=9.84
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
source=("https://github.com/easylogging/easyloggingpp/archive/${pkgver}.tar.gz")
noextract=()
sha1sums=('df2d504250b5bed5b5c62b7e1d08063979f94e1c')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/easylogging++.h" "${pkgdir}/usr/include/easylogging++.h"
}
