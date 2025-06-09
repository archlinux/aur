# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=estedad-mad-fonts
pkgver=1.1v
pkgrel=1
pkgdesc="An English-Arabic font."
url="https://github.com/MDarvishi5124/Estedad-Mad/"
arch=('any')
license=('OFL')
provides=('estedad-mad' 'estedad-mad-fonts')
source=("https://github.com/MDarvishi5124/Estedad-Mad/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d110000f2b90a622af541767eb429392fbef5398641e3d389818c18e2a065024')

package() {
  cd "${srcdir}/Estedad-Mad-${pkgver}"

  install -Dm644 Fonts/*.ttf \
    -t "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm644 Fonts/*.woff2 \
    -t "${pkgdir}/usr/share/fonts/woff2/"

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 CHANGELOG.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 documentation/*.png \
    -t "${pkgdir}/usr/share/doc/${pkgname}/documentation/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 Sources/*.glyphs \
    -t "${pkgdir}/usr/share/doc/${pkgname}/sources/"
}
