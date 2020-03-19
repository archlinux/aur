# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kyma-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Simple set of commands to manage a Kyma installation'
arch=('x86_64')
url="https://github.com/kyma-project/cli"
license=('Apache2')
provides=('kyma' 'kyma-cli')
source=("${url}/releases/download/${pkgver}/kyma_Linux_x86_64.tar.gz")
md5sums=('63cda4203369516a95f785138afb6d63')

package() {
  cd "${srcdir}"
  install -Dm755 kyma "${pkgdir}/usr/bin/kyma"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/kyma/LICENSE"
}
# vim:set ts=2 sw=2 et: