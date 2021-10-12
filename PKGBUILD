# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=cozette-otb
pkgver=1.13.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts.zip")
sha256sums=('11590b29856d9ffb2dc6c606009168ea87a3ecde7bcbe9fe542bc34b406c868d')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
