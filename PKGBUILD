# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.6.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('b34ea0b41bc6995e95abf39f48171ad3a9a358033d79936bf97b831ec0cb2fff'
            'f4f7d7ea6cd0a636436b82c4643a302c8b6be327a1344d7ce51d1aea9894d28e')

package() {
    cd "${srcdir}"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
