# Maintainer: Holger Brandl https://github.com/holgerbrandl, Marcin Kuszczak https://github.com/aartiPl

pkgname=kscript
pkgver=4.2.0-RC.3
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix and Windows based systems'
arch=('any')
url='https://github.com/kscripting/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}-bin.zip::https://github.com/kscripting/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('f34f95d82190ae95585b2c22c6feb4c7313b25ca53a31a8b52161fb9060ec2c0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
