# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=proji
pkgname=${_pkgname}-bin
pkgver=0.19.2
pkgrel=1
pkgdesc="A powerful cross-platform CLI project templating tool"
arch=("x86_64")
url="https://github.com/nikoksr/proji"
license=("custom:MIT")
depends=("glibc")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nikoksr/proji/releases/download/v${pkgver}/proji-Linux-64bit.tar.gz")
sha512sums=('SKIP')

package() {
    install -Dm755 "proji" "${pkgdir}/usr/bin/proji"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
