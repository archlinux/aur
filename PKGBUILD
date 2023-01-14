# Maintainer: Holger Brandl https://github.com/holgerbrandl, Marcin Kuszczak https://github.com/aartiPl

pkgname=kscript
pkgver=4.2.0
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix and Windows based systems'
arch=('any')
url='https://github.com/kscripting/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}-bin.zip::https://github.com/kscripting/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('35b47b51b3724e4f69c357f443bb4e9d13208d435d5d8478a2c4b48dfa18c395')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
