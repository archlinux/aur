# Maintainer: Masahiro Kitagawa <arctica0316[at]gmail[dat]com>

pkgname=omegat-textra-plugin
pkgver=2020.2.2
pkgrel=1
pkgdesc="NICT TexTra Machine Translation API plugin for OmegaT"
arch=('any')
url="https://github.com/miurahr/${pkgname}/"
license=('GPL3')
depends=('omegat')
options=('!strip')
source=("https://github.com/miurahr/${pkgname}/releases/download/v2020.2.2/${pkgname}-${pkgver}.zip")
sha256sums=('97ccbc96a8c1566768a8765cc36388c770bdaa68dcb035b4d779cc784cccd3e4')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/java/omegat/plugins/textra
  cp -a "${pkgname}-${pkgver}"/* "${pkgdir}"/usr/share/java/omegat/plugins/textra
}
