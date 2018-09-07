# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=kscript
pkgver=2.5.0
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin' 'maven')
source=("${pkgname}-${pkgver}.bin.zip::https://github.com/holgerbrandl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-bin.zip")
sha256sums=('e595a511f34dc2b3a863673c1b91e9b5f33d501c299c30e052a1de7fc2e311fd')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin"

    install -Dm 755 kscript "${pkgdir}/usr/bin/kscript"
    install -Dm 644 kscript.jar "${pkgdir}/usr/bin/kscript.jar"
}
