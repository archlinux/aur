# Maintainer: Steven Huang <s@stvhuang.me>

pkgname=ttf-cmu-sans-serif
pkgver=1.0
pkgrel=1
pkgdesc="CMU Sans Serif"
arch=('any')
url="https://fontlibrary.org/en/font/cmu-sans-serif"
license=('OFL')
depends=()
source=('https://fontlibrary.org/assets/downloads/cmu-sans-serif/0da0d92e6bacf5e091c1ae85c4da581d/cmu-sans-serif.zip')
sha256sums=('a28376915ebe43e78e580ef9646663f08fe3f782767d1c11aeeb36ee2c712c23')

package() {
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 Sans/*.ttf
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 "Sans Demi-Condensed"/*.ttf
    install -vDm644 Sans/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
