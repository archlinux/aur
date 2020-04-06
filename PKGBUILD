# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.8.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('f9a8c3c8cffe8ab426ff0655b890ccff0988dc03f5634c69c8f4bc6d131f83ff'
            '22336b060213a033cd56dd6c58ae86d9cd4a02d67a226e82c8a5338df94e4e08')

package() {
    cd "${srcdir}"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

