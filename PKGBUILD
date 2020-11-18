# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lstags-bin
pkgver=1.2.20
pkgrel=1
pkgdesc='Manipulate Docker images across different registries'
arch=('x86_64')
url="https://github.com/ivanilves/lstags"
license=('Apache')
provides=('lstags')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lstags-linux-v${pkgver}.tar.gz")
sha256sums=('848a983e5604928ee913ba87b7d02ac7b0070b74fa22197ee44401c88503faf1')

package() {
  install -Dm755 "${srcdir}"/lstags "${pkgdir}/usr/bin/lstags"
}
# vim:set ts=2 sw=2 et:
