# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.6.3
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteVector.ttf"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('bd7a62a888741409ba2eeff69ff52e5bdb0c60f9ddfe13e3684ee1fc7fd8807d'
            'e76870c01e6eb6907c8cf19cbf6bfd2e9634428a332c2e719bff0754c0335e5f')

package() {
    cd "${srcdir}"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
