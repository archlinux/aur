# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=kscript
pkgver=2.7.1
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}.bin.zip::https://github.com/holgerbrandl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('bf5c095dc3321b597c787f281ac690d51928da88d29ee29bff48ed5233d1840a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
