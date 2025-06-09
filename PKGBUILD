# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sorena-fonts
pkgver=1.2.0
pkgrel=1
pkgdesc="An English-Arabic pixel font."
url="https://github.com/MDarvishi5124/Sorena"
arch=('any')
license=('OFL')
provides=('sorena' 'sorena-fonts')
source=("https://github.com/MDarvishi5124/Sorena/archive/refs/tags/1.2.0v.tar.gz")
sha256sums=('8a85b40122144d7fe9d77d47076eb9be8851bdae608d550e11090b8b8ea2d704')

package() {
  install -Dm644 "${srcdir}/Sorena-1.2.0v/Fonts/ttf/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm644 "${srcdir}/Sorena-1.2.0v/Fonts/webfont/"*.woff2 \
    -t "${pkgdir}/usr/share/fonts/woff2/"

  install -Dm644 "${srcdir}/Sorena-1.2.0v/README.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/Sorena-1.2.0v/CHANGELOG.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/Sorena-1.2.0v/documentation/"*.png \
    -t "${pkgdir}/usr/share/doc/${pkgname}/documentation/"

  install -Dm644 "${srcdir}/Sorena-1.2.0v/OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 "${srcdir}/Sorena-1.2.0v/Source/"*.glyphs \
    -t "${pkgdir}/usr/share/doc/${pkgname}/source/"
}
