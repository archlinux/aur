# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=cozette-otb
pkgver=1.19.2
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('1f7b0287ea991b1f7a791491dfad6fbc6d253601a6c259fe54cef102b7a12bf1')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

