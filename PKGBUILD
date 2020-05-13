# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lstags-bin
pkgver=1.2.15
pkgrel=1
pkgdesc='Manipulate Docker images across different registries'
arch=('x86_64')
url="https://github.com/ivanilves/lstags"
license=('Apache')
provides=('lstags')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lstags-linux-v${pkgver}.tar.gz")
sha256sums=('482be78d3444691781192468437a15b2ff7bf21c161ac2f84b91c7b0a257aff5')

package() {
  install -Dm755 "${srcdir}"/lstags "${pkgdir}/usr/bin/lstags"
}
# vim:set ts=2 sw=2 et: