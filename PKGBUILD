# Maintainer: Amanda <amanda at smart dot net>

pkgname=grpcurl-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64')
url='https://github.com/fullstorydev/grpcurl'
license=('MIT')
provides=('grpcurl')
conflicts=('grpcurl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fullstorydev/grpcurl/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('564ad41b4e2364fa3232e457dbda22eb5e74a0105ad62693d5c1a05fc542dd3b')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
