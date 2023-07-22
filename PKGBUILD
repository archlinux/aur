# Maintainer: Holger Brandl https://github.com/holgerbrandl, Marcin Kuszczak https://github.com/aartiPl

pkgname=kscript
pkgver=4.2.3
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix and Windows based systems'
arch=('any')
url='https://github.com/kscripting/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}-bin.zip::https://github.com/kscripting/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('1dda3b041bc9af41bb0e3b78818ef5c99df845ee0e06a258d117ce70f1ec5941')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
