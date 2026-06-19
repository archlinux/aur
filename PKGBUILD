# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('e083d2ce9ae6a32e12ed5ea01c6841723876c8f4a90e267935ba9d77006278c300bf99a6b20ffef3c4696ac7843094292ccadf8e0ae468027a9ff4431b8a0b30')
sha512sums_i686=('7e981b0d78aeea4103dddda7c96274b26c0e988170f1dde8781294fcbc338945763cbf2aeec2bcbff47a69bcb5d72476a049ed1014925d887dedb66eef6555ae')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
