# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('bf3a98f850b628da1a591a18858bb6a9bd97a63f5c48e198797f907e9e039705')
sha256sums_i686=('1f10a0487e2d02ced6cf5cc414105f69d0da21feec8aabfb03221cf42cd99901')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
