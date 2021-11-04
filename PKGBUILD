# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.27
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('caf9ee3fa7018766a8ded8e83f558f50055ff9665a116f79feb08c75d7db2305')
sha256sums_i686=('d406ca582b49550a1e6442a0df8e250f44d1cf02546389d6f414a2b736979a50')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
