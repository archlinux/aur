# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
pkgname=cozette-otb
pkgver=1.23.2
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
source=("https://github.com/slavfox/Cozette/releases/download/v.${pkgver}/CozetteFonts-v-${pkgver//./-}.zip")
sha256sums=('88428fabfb47bed97878e485d6dd22023bed8bd3ca0f4aea5bf11b8d4473b748')

package() {
    cd "${srcdir}/CozetteFonts"
    install -vDm 644 "cozette.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "cozette_hidpi.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

