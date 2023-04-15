# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
conflicts=('shell2http')
provides=('shell2http')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msoap/shell2http/releases/download/v${pkgver}/shell2http_${pkgver}_linux_amd64.tar.gz")
sha256sums=('82881123f9f027648e67904cef616729e693f12b09c917e41cf9566e9c337a03')

package() {
  install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1 -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
