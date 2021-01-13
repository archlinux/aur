# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('ddcea15cae31d77d652b63a58a9c41a7c26b10267c14b7e8e3c398c7002096a7')
sha256sums_i686=('a893c39d5db1f41c3787f6e42c6b18efc309c940213c1d5c1e254ff76c145650')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
