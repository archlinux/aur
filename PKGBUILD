# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=crenv
pkgver=1.1.0
pkgrel=1
pkgdesc='Crystal version manager like rbenv'
arch=('x86_64')
url='https://github.com/crenv/crenv'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/crenv/crenv/master/LICENSE")
sha256sums=('30d48de8861da67daeb0f9e65fdc3afdc06e3ee1901a2a4012e5ffa207e203ab'
            '0d6be1a1350cf674a3c6e8e43bd6137f1a9a0f04e8e656a83446d13358be003c')
noextract=("LICENSE")

package() {
  cd "${srcdir}/crenv-${pkgver}"

  PREFIX="${pkgdir}/usr" ./install.sh
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/crenv/LICENSE"
}
