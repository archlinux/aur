# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=fullstorydev
_pkgname=grpcurl
pkgname=${_pkgname}-bin
pkgver=1.9.3
pkgrel=3
pkgdesc='Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers'
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/grpcurl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a926b62a85787ccf73ef8736b3ae554f1242e39d92bb8767a79d6dd23b11d1d5')
sha256sums_aarch64=('b20a00c1cb82ab81ec32696766d4076e99b4cb5ca0823a71767ba64dbea0f263')

package() {
  install -Dm0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/grpcurl/LICENSE
  install -Dm0755 "${srcdir}"/grpcurl "${pkgdir}"/usr/bin/grpcurl
}
