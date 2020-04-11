# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gaper-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Builds and restarts a Go project when it crashes or some watched file changes'
arch=('x86_64')
url="https://github.com/maxcnunes/gaper"
license=('MIT')
provides=('gaper')
source=("${url}/releases/download/v${pkgver}/gaper_${pkgver}_linux_amd64.tar.gz")
md5sums=('e50f85e572b818dc42d972ef6b5e4da8')

package() {
  install -Dm755 "${srcdir}"/gaper "${pkgdir}/usr/bin/gaper"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/gaper/LICENSE"
}
# vim:set ts=2 sw=2 et: