# Maintainer: Amanda <amanda at smart dot net>

pkgname=grpcurl-bin
pkgver=1.8.1
pkgrel=1
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64')
url='https://github.com/fullstorydev/grpcurl'
license=('MIT')
provides=('grpcurl')
conflicts=('grpcurl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fullstorydev/grpcurl/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('6b6f2ca6536e944b9dfdfa7a50f5afd2f91e87b5606fd744b6a41f55acdfebbb')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
