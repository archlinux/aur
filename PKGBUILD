# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=quick-skeleton-bin
pkgver=0.4.7
pkgrel=1
pkgdesc='Simple tool for scaffolding'
arch=('x86_64')
url="https://github.com/arthrp/quick-skeleton"
license=('GPL3')
provides=('quick-skeleton')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/quick-skeleton")
sha256sums=('86bf0622f2d2482d1d972ad25016f52b9a100bfa69de22bb369fbf91da2e3d24')

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver} "${pkgdir}/usr/bin/quick-skeleton"
}
# vim:set ts=2 sw=2 et: