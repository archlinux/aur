# Maintainer: Steven Huang <s@stvhuang.me>

pkgname=ttf-cmu-serif
pkgver=1.0
pkgrel=1
pkgdesc="CMU Serif"
arch=('any')
url="https://fontlibrary.org/en/font/cmu-serif"
license=('OFL')
depends=()
source=('https://fontlibrary.org/assets/downloads/cmu-serif/59c4efc3fa08079ca44060ca808c8f58/cmu-serif.zip')
sha256sums=('1e9faf3b1a054cd94507469eeda2a3acab1774bb4768b1585e2bdf4558e3c633')

package() {
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 Serif/*.ttf
    install -vDm644 Serif/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
