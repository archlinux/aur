# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.7.2
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('b2be1578b91688517477b2ed6005093d1613425d9febb05ab880d46f3719ab4e'
            'ef07880cd091fb674ceaa54a30678dbae3a18751900810f43db0b316916c9218')

package() {
    cd "${srcdir}"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

