# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.1
pkgrel=1
pkgdesc="Offline search engine for ArchWiki and manual pages combined"
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'arch-wiki-docs' 'fzf' 'ripgrep' 'awk' 'xdg-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e4e47389dd89a6138e1a18bf2fb6d6506217c8c2a0a628d14c378162033cdd06')

package() {

  cd "${pkgname}-${pkgver}"
  
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

}
