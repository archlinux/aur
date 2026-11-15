# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.20.0
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL-3.0')
depends=('hledger')
options=(!debug)
source=(
	"https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/hledger-flow-linux-x64.tar.gz"
)
sha256sums=(
	"245f706abb2053632004c900bfa982ba1000ef6f0eea2b7be22cc2a60be7c452"
)

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
}
