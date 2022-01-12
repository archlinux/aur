# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=random123
pkgver=1.14.0
pkgrel=1
pkgdesc="counter-based random number generators library"
arch=(any)
url="https://www.deshawresearch.com/resources_${pkgname}.html"
license=('BSD')
#source=("https://www.deshawresearch.com/downloads/download_${pkgname}.cgi/${pkgname^}-${pkgver}.tar.gz")
source=("https://github.com/DEShawResearch/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('effafd8656b18030b2a5b995cd3650c51a7c45052e6e1c21e48b9fa7a59d926e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  cp -r "include" "${pkgdir}/usr"
}
