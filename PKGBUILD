# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.48
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('426644a7ad57de0f5537eed74604b66bcb543ac1751dc71bf289c2a9b92fe589488ce3ce9d89626dca968a4997dc3cbf39d8331a63872f07e8f6185397de38b2')
sha512sums_i686=('c12ed418dafa5ed61a419d6d36d948004623b605b1177175965e735fa0d36d5c59fc2f9449ca155a2e322b3d31777929a5cd987f6f53781c15a537d8a2d5715e')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
