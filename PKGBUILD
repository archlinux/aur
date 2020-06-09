# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache 2.0')
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('b85515d8a2f876894ed16207b606dafeb890e81f5756ccb5495b0677ed8afd3d')
sha256sums_i686=('e9887f202cdcf8f5d7a359447823724d9554c8a99b99a8d9cf12b280dd8896b4')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
