# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=nodenv-node-build
pkgver=4.9.61
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9890da9dc0873a4aa245835a635a0c8789f9462bf1992895e6ebb3459749c6b3')
conflicts=("${pkgname}-git"
           "node-build")

package() {
  cd "${srcdir}/node-build-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  PREFIX="${pkgdir}/usr" ./install.sh
}
