# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.13
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
makedepends=('make')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'findutils' 'coreutils' 'sed' 'grep' 'parallel')
optdepends=('arch-wiki-docs: enable Arch Wiki')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4a34d3a47ec22dfa4b3a759d7bed4d01bb25b5b5d7844d02ae3b7f2b33f18274')
backup=('etc/wikiman.conf')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}