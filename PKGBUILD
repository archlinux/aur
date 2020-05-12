# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goweight-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='A tool to analyze and troubleshoot a Go binary size'
arch=('x86_64')
url="https://github.com/jondot/goweight"
license=('Apache')
provides=('goweight')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/goweight_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('d63ec46fd7706a78906d41ea10660224f089b5eb4d4e077c15dc3ad9c6aed7bd')

package() {
  install -Dm755 "${srcdir}"/goweight "${pkgdir}/usr/bin/goweight"
  install -Dm644 "${srcdir}"/README.md "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et: