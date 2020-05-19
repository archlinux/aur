# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=boilr-bin
pkgver=0.3.0
pkgrel=2
pkgdesc='Boilerplate template manager that generates files or directories from template repositories '
arch=('x86_64')
url="https://github.com/tmrts/boilr"
license=('Apache')
provides=('boilr')
source=("${pkgname}-${pkgver}.tgz::${url}/releases/download/${pkgver}/boilr-${pkgver}-linux_amd64.tgz")
sha256sums=('bc94cdf20d977172637a4995ea0de17b3724d2980d3faa514ab6ee9476eac055')

package() {
  install -Dm755 "${srcdir}"/boilr "${pkgdir}/usr/bin/boilr"
}
# vim:set ts=2 sw=2 et: