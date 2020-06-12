# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache 2.0')
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy-linux."
source_x86_64=("${_src}amd64-v${pkgver}.tar.gz")
source_i686=("${_src}386-v${pkgver}.tar.gz")
sha256sums_x86_64=('d67947f793196431045ae6554afcef0ea7996aa61181cd907280a042549dbc1f')
sha256sums_i686=('52dc24136966c2d6d40b3535adfeb0a8c1c7ccee9cad14efc7c6ad52f1cf22a2')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
