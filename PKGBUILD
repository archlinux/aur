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
sha256sums_x86_64=('ef9979ec83d99e1e0a50a4263bc7397e5b5f4108508f7136cd729770e88eaba2')
sha256sums_i686=('c9fa425e8f712abe14bdbd593b46b6da7db3ec8fe3b7dcf9a4bf23da81909f14')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
