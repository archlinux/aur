# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('dbf04a78231b6c638f10d470f6fc67a7e3a7bfa5d621ef2e2b97707d44790b84')
sha256sums_i686=('b4ea06b7f735dad478171aca0282874873daa05886da81b9c630e9ba3346a5cc')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
