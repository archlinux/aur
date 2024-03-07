# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.46
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('3ebdc488a9fdfa1a02f93bbb35af322f83e1d9cc7f90a0cff4d1b4d355fa6bbc21e3271be0b0926573d4cbf87ea66a6c1045cbd47d550edda4621075eafa12f8')
sha512sums_i686=('0d4c69724871b8a048da97eca3b74e56ac948784476f78710960bc12c56f9f311b4469792353acca1c0f38ce3c4e4a13fbc823e55d474e5d447c67497e0e57d9')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
