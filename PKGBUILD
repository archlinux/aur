# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.12.1
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
makedepends=('make')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m' 'findutils' 'coreutils' 'sed' 'grep')
optdepends=('arch-wiki-docs: enable Arch Wiki')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d22e6525c8702e36d94dabd596b59b4abe8ff45ed2a18c3f2c4fb0ca2c5814d5')
backup=('etc/wikiman.conf')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}