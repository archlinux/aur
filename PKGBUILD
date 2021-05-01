# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=ttf-hackgen-nerd
pkgver=2.3.2
pkgrel=1
pkgdesc="HackGen is a composite font of Hack and GenJyuu-Gothic."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("${url}/releases/download/v${pkgver}/HackGenNerd_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
sha256sums=('f685accfa35ecc3e1a6927270e16d800b3b1c4527871cb3efca1e84651ff16e9'
            '8ac2fc3472cd8c8c988bbd047a9739f528f614a3e61ff0925e26d2e76e53301d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGenNerd_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

