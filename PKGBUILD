# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache 2.0')
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('eea1326e2bf2c28ec6d9b3ec2d648b06cb418a4c9f43639fc09a902744d3e212')
sha256sums_i686=('aa79ee6f37dc95c264d140c5f0057fa6f3c95ae095aef21c9cb8723a61f0b21a')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
