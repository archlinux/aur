# Maintainer: Hiroshi Miura <miurahr[at]northside[dat]tokyo>

pkgname=omegat-round-theme
pkgver=0.1.0
pkgrel=1
pkgdesc="Round themes for OmegaT"
arch=('any')
url="https://github.com/miurahr/${pkgname}/"
license=('GPL3')
depends=('omegat-beta')
options=('!strip')
source=("https://github.com/miurahr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('eae58701fceffd52f4a3073161639d65a3cc8afd893ad6a1ffd8c0a9102234e2')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/java/omegat/plugins/round-themes"
  cp -a "${pkgname}-${pkgver}"/* "${pkgdir}/usr/share/java/omegat/plugins/round-themes"
}
