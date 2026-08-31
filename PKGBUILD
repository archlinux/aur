# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=fullstorydev
_pkgname=grpcurl
pkgname=${_pkgname}-bin
pkgver=1.9.4
pkgrel=1
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('97e13d58d2733a0e62cd2571d1d5f0c02823f0d25282f08bddedf1ad9c5d1736')
sha256sums_aarch64=('ad66227d90631da5428b4a5ccf28d63846f0f15649d8b2367df044a59edbb617')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
