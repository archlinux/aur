# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.5.0
pkgrel=2
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteVector.ttf"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('9936d1fdac83ac5b852d5cbb6f2051d62fc2a1e66a96154a24813f3f956d2a38'
            '44d5071f19a83dcdfbffadfe3878416fc9e260d46cb1bb5e94107cf5dc6e2025')

package() {
    cd "${srcdir}"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
