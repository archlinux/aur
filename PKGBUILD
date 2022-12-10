# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=cozette-otb
pkgver=1.19.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('988ba22b8d72dca9afacc86d848755ce81daec752d7d471533264bec5d04c21a')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

