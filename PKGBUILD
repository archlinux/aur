# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.28
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('66dd186572980333a9fca1bc9722547696d15a5187706c3a8e399994f9a18bac')
sha256sums_i686=('c865e90985c2110a5f4aea884c10f685d57da880bd5e6492397772f9dde28ff8')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
