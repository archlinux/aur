# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.20
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('31b0037369e4a8108c5f03249058d2918117b3647cd6b7f8d1bc6bb5e5603bfa')
sha256sums_i686=('165be9568ca61293f1d24c720076c4289c7b90f04e0b776117989c292e5fd12a')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
