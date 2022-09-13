# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-bin
pkgver=1.14.2
pkgrel=2
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
conflicts=('shell2http')
provides=('shell2http')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msoap/shell2http/releases/download/v${pkgver}/shell2http_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4708b1f89599f1bcd7aabd5e6a2843b2ed3580be207673b604f964b5d20cd3b5')

package() {
  install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1 -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
