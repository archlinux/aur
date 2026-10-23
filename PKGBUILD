# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=2.1.1
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('7f72645ef01cb11f367b3fcbaf57288de1e110509ce11093c04bb4a25147a6172457b1f45edc399eca6d15cc8957754fe8b26dbd865a5720e366b4564b3a3f87')
sha512sums_i686=('1a430cce67c403d4a492f8c797e63e3b8983fbc5711056ed73d48653124ab8ba3793e82f414731506a63ca2d7d7ef1ec0aa67ccf0e35470d8e7b536cff4430c4')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
