# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.11.2
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
makedepends=('make')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'findutils' 'coreutils')
optdepends=('arch-wiki-docs: enable Arch Wiki')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fb241d3427caddebd3d7e26efae836117f3a004f2889592542b71b72d9453c96')
backup=('etc/wikiman.conf')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}