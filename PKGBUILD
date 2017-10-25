# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail com>

pkgname=kscript
pkgver=2.0.2
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin')
source=("${pkgname}-${pkgver}.bin.zip::https://github.com/holgerbrandl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('640d6498b862095b8dcc8e3e0bd73f9c349299a6f29b0316dcfa2b2ee2b65864')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
