# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.13.1
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
makedepends=('make')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'findutils' 'coreutils' 'sed' 'grep' 'parallel')
optdepends=('arch-wiki-docs: enable Arch Wiki')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('096a163022f14068edf9aef132d878a8a5dbacdcec61dd0028efeb811a0975b6')
backup=('etc/wikiman.conf')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}