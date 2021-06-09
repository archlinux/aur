# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.22
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('5b3bac98b07e2719174575d8d82b27b8eead6eaec0efb4dc9721ebcfe3207682')
sha256sums_i686=('f2ed31746e8211ef30ef85e0f2190b5c87bc721501d850c855623631f5988d42')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
