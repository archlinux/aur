# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flog-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='A fake log generator for common log formats'
arch=('x86_64')
url="https://github.com/mingrammer/flog"
license=('MIT')
provides=('flog')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/flog_${pkgver}_linux_amd64.tar.gz")
sha256sums=('076b448e9ba80408845b6f72be76b1e37fe0b0310470ecc8258a8f8844a9eca3')

package() {
  install -Dm755 "${srcdir}"/flog "${pkgdir}/usr/bin/flog"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
