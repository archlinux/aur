# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.16
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('2c9d6b0e72a030f8dfbb150b1dd296616a7d35a127a57676c9e904d7e2af60fc')
sha256sums_i686=('5575b1c8fdcf291df07c8dce7312e30cb3d990f020a64ab69b2e67a22361cf6a')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
