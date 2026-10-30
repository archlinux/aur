# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sorena-fonts
pkgver=1.3
pkgrel=2
pkgdesc="English-Arabic pixel font"
url="https://github.com/MohamadDarvishi/Sorena"
arch=('any')
license=('OFL-1.1')
provides=('sorena')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('68bab394217a3086152b3e019843538a451409d7bbdc23b6c54374145b347e9c')

package() {
  cd "${srcdir}/Sorena-${pkgver}"

  install -Dm644 "Fonts/ttf/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm644 "Fonts/webfont/"*.woff2 \
    -t "${pkgdir}/usr/share/fonts/woff2/"

  install -Dm644 "Fonts/Farsi_Digits/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 "Fonts/Farsi_Digits/"*.woff2 \
    -t "${pkgdir}/usr/share/fonts/woff2/"

  install -Dm644 "Fonts/misc/Farsi-Digits/ttf/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 "Fonts/misc/Farsi-Digits/webfont/"*.woff2 \
    -t "${pkgdir}/usr/share/fonts/woff2/"

  install -Dm644 "README.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "CHANGELOG.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "documentation/"*.png \
    -t "${pkgdir}/usr/share/doc/${pkgname}/documentation/"

  install -Dm644 "OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 "Source/"*.glyphs \
    -t "${pkgdir}/usr/share/doc/${pkgname}/source/"
  install -Dm644 "Source/Glyphs Format/"*.glyphs \
    -t "${pkgdir}/usr/share/doc/${pkgname}/source/"
  install -Dm644 "Source/Fontcreator Format/"*.fcp \
    -t "${pkgdir}/usr/share/doc/${pkgname}/source/"
}
