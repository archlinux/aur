# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail com>

pkgname=kscript
pkgver=2.4.1
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}.bin.zip::https://github.com/holgerbrandl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('03a2f4d4647a702419f0bb3bb95fa2f208e83498579fcd77755fee05e3a1e316')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
