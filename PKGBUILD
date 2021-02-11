# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
pkgver=1.0.12
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('290dec3a860f1847efc042ae291019e50ac0424cd8dd2865e857a2566403d4c4')
sha256sums_i686=('b27d16d9401aa621302adc4a7e7e69952490492f51c66ecf647d35761a0332df')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
