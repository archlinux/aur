# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.8
pkgrel=1
pkgdesc="Offline search engine for manual pages, Arch Wiki, Gentoo Wiki and other documentation."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1f8bc6b448c1807131c56e583da0f032dd13828eac824ec1801c0784cd3b8040')
backup=('etc/wikiman.conf')
optdepends=('arch-wiki-docs: enable Arch Wiki')

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install
}