# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache 2.0')
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('377169cf73757b59a2a969ee5c2e022849b3f106b0965c4c6a5699193db8aa45')
sha256sums_i686=('73a5a89a37f605268a4d7facac0b91aa8caa3aaf2c94a88ee1dbb5bd1fbeb785')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
