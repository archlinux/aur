# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.21
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('77dcf21ce6276cdb08ba5247b7c272ff495202fd4e719632bc7c5df5ade00aef')
sha256sums_i686=('1f2bb9d48d7172855a0d40b0c5ecb2d2f6976677e55ec03d84815fd7ac6f6c70')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
