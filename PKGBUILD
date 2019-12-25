# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=1.4.1
pkgrel=1
pkgdesc="HackGen is a composite font of Hack and GenJyuu-Gothic."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
md5sums=("efd9891606d3d3b735e72c994ca85bb5"
         "8ddf37fb8b4fe29428dd085beb8a8718")

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
