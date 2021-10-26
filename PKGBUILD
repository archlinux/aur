# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.26
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('1d683a4c0ef1b31e2be2016179ff4d267896a9c8facf194c47b3e6b67dd6375d')
sha256sums_i686=('feaa5fbecbba07dbb1c21742bcf995a688cb51dce31c85b66d087b940018fab6')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
