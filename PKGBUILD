# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.45
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('30466bf6c01598ebb9d076f591a8a80fc715c02629a6e1261e3a5b7835ff58145001352c3e0a82805938c4a4575897db3852ee7177c77df628df00ac6162f020')
sha512sums_i686=('5ec6b7bacbf12dce2070132eb8d7b782c5e652e7c9349c53086e1cdbb168572e81c0b2e329a799e464a1f641e6856105e000cdb0fb43e3268d248519affd9b31')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
