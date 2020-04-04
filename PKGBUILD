# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goweight-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='A tool to analyze and troubleshoot a Go binary size'
arch=('x86_64')
url="https://github.com/jondot/goweight"
license=('Apache-2.0')
provides=('goweight')
source=("${url}/releases/download/v${pkgver}/goweight_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('7fee7ed7f4da52605f3fbeccf08b19a5')

package() {
  install -Dm755 "${srcdir}"/goweight "${pkgdir}/usr/bin/goweight"
  install -Dm644 "${srcdir}"/LICENSE* "${pkgdir}/usr/share/licenses/goweight/LICENSE"
}
# vim:set ts=2 sw=2 et: