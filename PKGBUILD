# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.15
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('6c0363ee66240dee1f1dbbe3e702a652040ac3ade221457317779076b48d027c')
sha256sums_i686=('2e968acca265e5a212211f5b72c9a1a692ee919f00a02b019dee044095c43dc2')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
