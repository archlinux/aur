# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lstags-bin
pkgver=1.2.14
pkgrel=2
pkgdesc='Manipulate Docker images across different registries'
arch=('x86_64')
url="https://github.com/ivanilves/lstags"
license=('Apache-2.0')
provides=('lstags')
source=("${url}/releases/download/v${pkgver}/lstags-linux-v${pkgver}.tar.gz")
md5sums=('9964e682dfd1420969666159f6bd6930')

package() {
  install -Dm755 "${srcdir}"/lstags "${pkgdir}/usr/bin/lstags"
}
# vim:set ts=2 sw=2 et: