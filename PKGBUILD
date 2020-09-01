# Maintainer Filip Parag <aur@filiparag.com>

pkgname=wikiman
pkgver=2.7
pkgrel=2
pkgdesc="Offline search engine for Arch Wiki, Gentoo Wiki and manual pages."
arch=('any')
url="https://github.com/filiparag/wikiman"
license=('MIT')
depends=('man' 'fzf' 'ripgrep' 'awk' 'w3m')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('21eb6cf3a50f74feb5d587223c7ec7b20d388ac910a2fa3057eb2003837752a6')
backup=('etc/wikiman.conf')
optdepends=('arch-wiki-docs: enable Arch Wiki')

package() {

  cd "${pkgname}-${pkgver}"
  make prefix=${pkgdir} install

}
