# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gaper-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Builds and restarts a Go project when it crashes or some watched file changes'
arch=('x86_64')
url="https://github.com/maxcnunes/gaper"
license=('MIT')
provides=('gaper')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/gaper_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7aeb6764b63037be03e047e4ea079c6f9683fb9b476ba92560d07dc10f15b899')

package() {
  install -Dm755 "${srcdir}"/gaper "${pkgdir}/usr/bin/gaper"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/gaper/LICENSE"
}
# vim:set ts=2 sw=2 et: