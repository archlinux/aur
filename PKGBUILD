# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('59e443042d10502d86cfe7cc06e74bf11e01cb493bcde3245d61b4e286bd5195')
sha256sums_i686=('99f7d48ad876f3b2c7e4f7d41662348ece28d52f72fdd60184abfb37b65f1844')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
