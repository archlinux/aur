# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('6676fa9f3ba6a5d0a7f3373194fa7eb46fba928f99ca971e7a9229e8806053b7')
sha256sums_i686=('0072a9f22598dcb6ec337da0e30ebc69a286f5bd2c7fbcb222766dde8cb61c36')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
