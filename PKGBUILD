# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.6.2
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteVector.ttf"
        "https://github.com/slavfox/Cozette/archive/v.${pkgver}.tar.gz")
sha256sums=('bfcd54bd00b667a6a4bbc93fedb62ed11a061e6ed77affb9e6388945612950d6'
            '71f32fa78071b95bc81ea7383c1bd08be85335e9c7d97c9dd6cba5a0cda6094d')

package() {
    cd "${srcdir}"
    install -vDm 644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "Cozette-v.${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
