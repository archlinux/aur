# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.6.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('1f7588d9ea0f28c651eb03d9719e585ca336d3dccb318d400b8c5d796f2979b1'
            'd5aa6decfa9efa7d480f7d1c44acd144b6ae870c56c802dbf1681ccecd164dce')

package() {
    cd "${srcdir}"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
