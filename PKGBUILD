# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.25
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('bc2d07582372f8e07fe923d4e77002f163d6bce6c01b356a8798a83c7320250e')
sha256sums_i686=('ccbddffde4c6b9cfc75a27644c21d9e25c7c0b54e3e753609c7615e0c357e296')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
