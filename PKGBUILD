# Maintainer: Tobi Fuhrimann

pkgname=nancy-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="A tool to check for vulnerabilities in your Golang dependencies"
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/nancy"
license=(Apache)
provides=(nancy)
_src="${url}/releases/download/v${pkgver}/nancy"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('cf8e8de55f3dd8da0fdea6db027f486de5798cf96a042022162d43b9b031b306')
sha256sums_i686=('e71b2a4a8b4007fc9691e58a8a2140559f36c422aa1b66ec2d9ccfde8dfa9f62')

package() {
	local x86_64=amd64 i686=386
	install -Dm755 nancy -t "${pkgdir}/usr/bin"
}
