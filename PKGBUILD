# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shell2http-bin
pkgver=1.17.0
pkgrel=1
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
conflicts=('shell2http')
provides=('shell2http')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msoap/shell2http/releases/download/v${pkgver}/shell2http_${pkgver}_linux_amd64.tar.gz")
sha256sums=('14b314a501bafa4c3819822fb0bdd1c6d8423ec495432116af184ebfdec3b296')

package() {
  install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1 -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
