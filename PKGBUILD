# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lstags-bin
pkgver=1.2.14
pkgrel=2
pkgdesc='Manipulate Docker images across different registries'
arch=('x86_64')
url="https://github.com/ivanilves/lstags"
license=('Apache')
provides=('lstags')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lstags-linux-v${pkgver}.tar.gz")
sha256sums=('cdd5d2ce578c4d1999a722df02ca231e1d3d398ddec2fa4725218a656f8d7403')

package() {
  install -Dm755 "${srcdir}"/lstags "${pkgdir}/usr/bin/lstags"
}
# vim:set ts=2 sw=2 et: