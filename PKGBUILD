# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=estedad-mad
pkgver=1.1v
pkgrel=1
pkgdesc="An English-Arabic font."
url="https://github.com/MDarvishi5124/Estedad-Mad/"
arch=('any')
license=('OFL')
provides=('estedad-mad')
source=("https://github.com/MDarvishi5124/Estedad-Mad/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d110000f2b90a622af541767eb429392fbef5398641e3d389818c18e2a065024')

package() {
  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/Fonts/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/${pkgname}/"

  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/Fonts/"*.woff2 \
    -t "${pkgdir}/usr/share/fonts/${pkgname}/"

  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/README.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  
  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/CHANGELOG.md" \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/Sources/"*.glyphs \
    -t "${pkgdir}/usr/share/fonts/${pkgname}/Sources/"

  install -Dm644 "${srcdir}/Estedad-Mad-${pkgver}/documentation/"*.png \
    -t "${pkgdir}/usr/share/doc/${pkgname}/documentation/"
}
