# Maintainer: Amanda <amanda at smart dot net>

pkgname=grpcurl-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64')
url='https://github.com/fullstorydev/grpcurl'
license=('MIT')
provides=('grpcurl')
conflicts=('grpcurl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fullstorydev/grpcurl/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('8db609af6cb3575df94f3da82034daf35c7da08196dcd3478c95dc469595aca2')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
