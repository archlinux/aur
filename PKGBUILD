# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('688a6e666339961688121cd95bb4b4aa2a939c80d2b7fed8fa4432ed0b164293bc363f19d95afd32746015510fb467044193c2a81ad5198b12f7673cdc2f25d8')
sha512sums_i686=('5caba4c54bfbbcf9951697473e4249fe20855930969b61a2d938f522562d722830afef5f65b5d6d89b1c2a368e1f712f66dff93540bf13c1c61480dc1ab6501a')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
