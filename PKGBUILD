# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=nodenv-node-build
pkgver=4.9.62
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bde221761028f19fbc7c0db64d4558ef7dc0fb9ded29546c90b7d73099bc5639')
conflicts=("${pkgname}-git"
           "node-build")

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  PREFIX="${pkgdir}/usr" ./install.sh
}
