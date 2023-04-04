# Maintainer: Amanda <amanda at smart dot net>

pkgname=grpcurl-bin
pkgver=1.8.7
pkgrel=1
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64')
url='https://github.com/fullstorydev/grpcurl'
license=('MIT')
provides=('grpcurl')
conflicts=('grpcurl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fullstorydev/grpcurl/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('b50a9c9cdbabab03c0460a7218eab4a954913d696b4d69ffb720f42d869dbdd5')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
