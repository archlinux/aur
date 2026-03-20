# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.16.3
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL-3.0')
options=(!debug)
source=(
	"https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/hledger-flow-linux-x64.tar.gz"
)
sha256sums=(
	"1727bcee07b91f36698a3bc164f4726b3b0143f5e4aa7c354a245bd9815d02cc"
)

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
}
