# Maintainer: Holger Brandl https://github.com/holgerbrandl, Marcin Kuszczak https://github.com/aartiPl

pkgname=kscript
pkgver=4.2.2
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix and Windows based systems'
arch=('any')
url='https://github.com/kscripting/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}-bin.zip::https://github.com/kscripting/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('af3288eb4369f23d5898fc24fe291e36d60f2818c3cc8f8091a8cc396d5520e1')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
