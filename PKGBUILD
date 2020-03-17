# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bee-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Bee is a tool for helping develop with beego app framework'
arch=('x86_64')
url="https://github.com/beego/bee"
license=('Apache2')
provides=('bee')
source=("${url}/releases/download/v${pkgver}/bee_${pkgver}_linux_amd64.tar.gz")
md5sums=('31ae330504f2fce170164688b03e7e96')

package() {
  cd "${srcdir}/bee_${pkgver}_linux_amd64"
  install -Dm755 bee "${pkgdir}/usr/bin/bee"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/bee/LICENSE"
}
# vim:set ts=2 sw=2 et: