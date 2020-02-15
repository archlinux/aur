# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.4.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('2dc676dbc340aa9ed4507d8a50421d6f4430283b97dc635f8986167c943848f5'
            '99a2fd4b3b37d33e0926eb98979d3af1e803ff94c40b25b62dfc8d1320131aea')

package() {
    cd "${srcdir}"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
