# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('6b1e4362157270c47d213522f7a5c52262c487a0b6107d41d99f49ae79f83fed')
sha256sums_i686=('02bdb456d963c05fa11926318dfe5c0e55e3d9072fd64668b5fafb9bb381cdd5')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
