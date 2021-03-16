# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('91ad2c7fa3d6d775c59b5c7e7f59d16c6de0fda95ffdc4c539b2ce201e0ce433')
sha256sums_i686=('c0d817c9fdad3c40bf2fa37a502bcecd999bd1703a3655fe8fe9c97c5b35cbdd')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
