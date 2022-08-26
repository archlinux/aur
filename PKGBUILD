# Maintainer: Holger Brandl https://github.com/holgerbrandl/kscript/

pkgname=kscript
pkgver=4.1.0
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}-bin.zip::https://github.com/holgerbrandl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('02c3a1c414d9fab6fd05cb41e3f5d50e0e590226edf6b44d80f779e71d8e5942')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}

