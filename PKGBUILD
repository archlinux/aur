# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.23
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('f822d3fe192d7cb355584d4b0a09314d79e5d8c0cdb8e6bd873146080e9f9acd')
sha256sums_i686=('5401725c132058854bd63b82c8cf7b8b3addc146ddafc0d3279694cd04fddd2c')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
