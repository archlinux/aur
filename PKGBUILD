# Maintainer Filip Parag <aur@filiparag.com>

pkgbase=wikiman
pkgname=wikiman
pkgver=2.0
pkgrel=1
pkgdesc="Offline search engine for ArchWiki and manual pages combined"
url="https://github.com/filiparag/wikiman"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
arch=('any')
sha256sums=('aa42612314d13e21f73f5a3e390c28e7804d50f62e660792f0f91d23a518688f')
depends=('man' 'arch-wiki-docs' 'fzf' 'ripgrep' 'awk' 'xdg-utils')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
