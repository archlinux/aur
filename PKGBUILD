# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flog-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='A fake log generator for common log formats'
arch=('x86_64')
url="https://github.com/mingrammer/flog"
license=('MIT')
provides=('flog')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/flog_${pkgver}_linux_amd64.tar.gz")
sha256sums=('06b3eccd9fd5e9b16a283c1cfb078b053dbfa96ec60677408c917b90a51d1c48')

package() {
  install -Dm755 "${srcdir}"/flog "${pkgdir}/usr/bin/flog"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: