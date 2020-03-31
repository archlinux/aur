# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.7.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteVector.ttf"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('ca7668c07cbe556c5ee1f6e379c7dcdc5d1cdfdf5e0ff263478d17f69987e29a'
            '8262d40d970fedc7ec7e9d7b8d56f5b66c1c23f49cc109cb0438c0452b85e68a')

package() {
    cd "${srcdir}"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
