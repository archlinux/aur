# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=proji
pkgname=${_pkgname}-bin
pkgver=0.19.2
pkgrel=2
pkgdesc="A powerful cross-platform CLI project templating tool"
arch=("x86_64")
url="https://github.com/nikoksr/proji"
license=("custom:MIT")
depends=("glibc")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nikoksr/proji/releases/download/v${pkgver}/proji-Linux-64bit.tar.gz")
sha512sums=('ff79f416403cfb9f1139aead48722f8df769278d713a2dc7e8d228140160240ae65ff56985202666e8ae68a592d8783b035ecc847b4eb7ddd8cb4e905bb21248')

package() {
    install -Dm755 "proji" "${pkgdir}/usr/bin/proji"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
