# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('7abd7df00a27283b3fdf6acf515b9f56f4ee9e02045f6201d288259adf0ebfcd3bd7dba67d675b6c5b2976c552b5e5f3cb4aa0b512fd119ff61babb00b7b11d1')
sha512sums_i686=('ae4425b036750e657e90bec7408d2685067dd1da5e40686ef2fb7135586c54469484255569d61f2a6bb89cdfb315dd7112756825bd6ab7a499a71864ca9a75b4')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
