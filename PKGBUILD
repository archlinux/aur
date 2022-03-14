# Maintainer: Hiroshi Miura <miurahr[at]northside[dat]tokyo>

pkgname=omegat-plugin-epwing
pkgver=2.2.1
pkgrel=1
pkgdesc="EPWING dictionary plugin for OmegaT"
arch=('any')
url="https://github.com/miurahr/${pkgname}/"
license=('GPL3')
depends=('omegat')
options=('!strip')
source=("https://github.com/miurahr/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('38dc8745b1a3eae3c464cc762ea231bf29b25c89650ff7048793a851f4d32f03')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/java/omegat/plugins/epwing
  cp -a "${pkgname}-${pkgver}"/* "${pkgdir}"/usr/share/java/omegat/plugins/epwing
}
