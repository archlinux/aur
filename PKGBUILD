# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.14
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('7422e61265edbd80a63a14cc0dafd2916955d2d2e73464008d350023d54427dd')
sha256sums_i686=('8544dd68a8aba060e66ad35fdbb94de4f363ef948bafa5db7607936b4caa310d')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
