# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache 2.0')
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('5509122a960a143552b6c9a8d65400b8db7d9fd3e0ff72c40dd973ee845d4c4a')
sha256sums_i686=('ea4bc7d25e273af269dc8335ca675997bea93141ebcbcd68deb54187edc71ca0')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
