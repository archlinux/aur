# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname="ttf-megrim"
pkgver=20160926
pkgrel=1
pkgdesc="Google Fonts Megrim by Daniel Johnson"
arch=('any')
license=('SIL Open Font License')
url="http://www.google.com/fonts/specimen/Megrim"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
_gitver='90abd17b4f97671435798b6147b698aa9087612f'
source=("https://github.com/google/fonts/raw/${_gitver}/ofl/megrim/Megrim.ttf"
        "https://github.com/google/fonts/raw/${_gitver}/ofl/megrim/OFL.txt")
md5sums=('e43a0f17594beb98a1f373738814ab9e'
         '7bf691260ffba0e9eee60d90e23916cc')

package() {
    install -Dm644 "Megrim.ttf" "${pkgdir}/usr/share/fonts/TTF/Megrim.ttf"
    install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
