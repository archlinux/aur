# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=nodenv-node-build
pkgver=4.9.60
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('dfc54f9da23925a0a8773ee1b30faa2c')

package() {
  cd "${srcdir}/node-build-${pkgver}"

  PREFIX="${pkgdir}/usr" ./install.sh
}
