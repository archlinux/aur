# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lstags-bin
pkgver=1.2.21
pkgrel=1
pkgdesc='Manipulate Docker images across different registries'
arch=('x86_64')
url="https://github.com/ivanilves/lstags"
license=('Apache')
provides=('lstags')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lstags-linux-v${pkgver}.tar.gz")
sha256sums=('8e40a6571d608819735ec8506b05052c03b48a5a62a218566e5354ebde82440a')

package() {
  install -Dm755 "${srcdir}"/lstags "${pkgdir}/usr/bin/lstags"
}
# vim:set ts=2 sw=2 et:
