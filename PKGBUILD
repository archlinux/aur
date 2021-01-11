# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('f33e5af30cf3d91dfa743814e99d130a18819b5f4eda6b5c22b7f3039d1d23b5')
sha256sums_i686=('a0d5d3b46f7640b35708a6b1d0b7aeb876458b3195443060fa76b7b0a10ba75e')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
