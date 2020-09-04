# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.11.1
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
makedepends=('make')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'findutils')
optdepends=('arch-wiki-docs: enable Arch Wiki')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8c6302a1120286937c4f0718a43540e68b9aaed64d76bfdbc1d1c5bc9e17671b')
backup=('etc/wikiman.conf')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}